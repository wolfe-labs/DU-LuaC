import fs from "fs";
import { moveSync } from "fs-extra";
import path from "path";
import crypto from "crypto";
import Application from "../Application";
import GitClient, { GitClientResult } from "../lib/GitClient";
import Project from "./Project";
import { CLI } from "../lib/CLI";
import ColorScheme from "../lib/ColorScheme";

export type LibraryRemote = {
  git: string,
}

export enum LibraryType {
  Raw = 'raw',
  Project = 'project',
}

export default class Library {
  /**
   * The library's unique identifier
   */
  readonly id: string;

  /**
   * The library type
   */
  readonly type: LibraryType;

  /**
   * The library path
   */
  readonly path: string;

  /**
   * The library source path
   */
  readonly sourcePath: string;

  /**
   * The library remote details
   */
  readonly remote?: LibraryRemote;

  /**
   * The library's project definition
   */
  private project!: Project;

  /**
   * Gets the library's project definition
   */
  getProject(): Project | null {
    return this.project;
  }

  /**
   * Initializes a new library reference
   * @param parentProject The project this library belongs to
   * @param data The data of this library
   */
  constructor(private parentProject: Project, data: any) {
    this.id = data.id;
    this.path = path.join(this.parentProject.getProjectDirectory(), data.path);
    this.remote = data.remote;

    // Attempts to load the project file, if it fails then set library type to raw instead
    try {
      this.project = Project.load(this.path);
      this.id = this.project.name;
      this.type = LibraryType.Project;
      this.sourcePath = this.project.getSourceDirectory();
    } catch (err) {
      this.type = LibraryType.Raw;
      this.sourcePath = this.path;
    }
  }

  /**
   * Converts the Library instance into a JSON representation
   */
  toJSON(): object {
    return {
      id: this.id,
      type: this.type,
      path: path.relative(this.parentProject.getProjectDirectory(), this.path).replace(/\\/g, '/'),
      remote: this.remote,
    };
  }

  /**
   * Generates a library from a project
   * @param project The project we're creating the library from
   */
  static loadFromProject(project: Project): Library {
    return Library.loadFromLocalPath(project, project.getProjectDirectory());
  }

  /**
   * Loads a library from a local path
   * @param dir The path to our library
   */
  static loadFromLocalPath(project: Project, dir: string): Library {
    // Checks if we have a valid project on the directory
    if (Project.isDirectoryProject(dir)) {
      return new Library(project, {
        path: path.relative(project.getProjectDirectory(), dir),
      });
    }

    // Handles raw libraries
    return new Library(project, {
      id: path.basename(dir),
      path: path.relative(project.getProjectDirectory(), dir),
    });
  }

  /**
   * Loads a library from a Git repository
   * @param url The URL to our Git repository
   */
  static loadFromGit(project: Project, url: string): Library {
    // Checks if Git is installed etc
    if (!GitClient.isGitInstalled()) {
      throw new Error('Git installation not detected!');
    }

    // Fails when not a valid Git URL
    if (!GitClient.isGitPath(url)) {
      throw new Error('Invalid Git path!');
    }

    // Parses our Git URL
    const gitInfo = GitClient.parseGitUrl(url);

    // This is our destination (temp) directory, it's a sha1 of our URL
    const tempDir = Application.getTempPath(crypto.createHash('sha1').update(url).digest('hex'));

    // Deletes our directory if it exists
    if (fs.existsSync(tempDir)) {
      fs.rmSync(tempDir, { recursive: true });
    }

    // Creates our directory
    fs.mkdirSync(tempDir, { recursive: true });

    // Attempts to clone Git repo
    let cloneResult!: GitClientResult;
    try {
      // First, try the provided URL
      cloneResult = GitClient.clone(url, tempDir);
    } catch (err) {
      try {
        // If fails, retry it with SSH
        cloneResult = GitClient.clone(`git@${gitInfo.resource}:${gitInfo.full_name}.git`, tempDir)
      } catch (err) {
        // Now we can fail
        throw new Error([
          `Error while fetching repository from Git: ${err}`,
          `Make sure you have the right access permissions to your repository and, if you're cloning via the SSH URL, you have the proper public and private keys set`,
          `Also, make sure the following Git path is correct: ${ColorScheme.highlight(url)}`,
        ].join('\n'));
      }
    }

    // This shouldn't happen
    if (!cloneResult) {
      throw new Error('Git command returned invalid result!');
    }

    // Extra error checks
    if (cloneResult.status != 0) {
      throw new Error([
        `Error while fetching repository from Git: ${cloneResult.output}`,
        `Make sure you have the right access permissions to your repository and, if you're cloning via the SSH URL, you have the proper public and private keys set`,
        `Also, make sure the following Git path is correct: ${ColorScheme.highlight(url)}`,
      ].join('\n'));
    }

    // Okay, let's generate an ID for our imported library (or use one, if it has)
    const libraryId = Project.isDirectoryProject(tempDir)
      ? Project.load(tempDir).name
      : `@${gitInfo.full_name}`;

    // Checks if it already doesn't exist
    const finalDir = path.join(project.getLibraryDirectory(), libraryId);
    if (fs.existsSync(finalDir)) {
      throw new Error('Library with same name already exists on the project!');
    }

    // Finally, let's move it to a local directory
    const finalDirParent = path.dirname(finalDir);
    if (!fs.existsSync(finalDirParent)) fs.mkdirSync(finalDirParent, { recursive: true });
    moveSync(tempDir, finalDir);

    // Initializes our library
    return new Library(project, {
      id: libraryId,
      path: finalDir,
      remote: {
        git: url,
      }
    });
  }

  /**
   * Whether this library contains a certain path
   * @param target The target path
   * @param useSourcePath Should we use source directory instead of actual project directory?
   */
  containsPath(target: string, useSourcePath: boolean = false): boolean {
    // If we have a project, use it's method instead
    if (this.project) return this.project.containsPath(target, useSourcePath);

    // Our base path
    const referencePath = this.sourcePath;

    // Converts the target path to absolute notation
    if (!path.isAbsolute(target)) {
      target = path.resolve(referencePath, target);
    }

    // Creates a relative path from current source directory and out absolute directory
    const relativePath = path.relative(referencePath, target);

    // If the relative path starts with '..' or is absolute (usually a different Windows disk), returns false
    return !!relativePath && !relativePath.startsWith('..') && !path.isAbsolute(relativePath);
  }
}