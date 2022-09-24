import path from "path";
import GitClient from "../lib/GitClient";
import Project from "./Project";

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
  id: string = '';

  /**
   * The library type
   */
  type: LibraryType = LibraryType.Project;

  /**
   * The library path
   */
  path: string = '';

  /**
   * The library remote details
   */
  remote?: LibraryRemote;

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
    } catch (err) {
      this.type = LibraryType.Raw;
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
    // Parses our Git URL
    const gitInfo = GitClient.parseGitUrl(url);
  }
}