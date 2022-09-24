import fs from "fs";
import path from "path";
import Build from "./Build";
import BuildTarget from "./BuildTarget";
import Library from "./Library";
import { SimpleMap } from "./SimpleMap";

/**
 * Represents a project file
 */
export default class Project {

  /**
   * The project name
   */
  name: string = '';

  /**
   * The project description
   */
  description: string = '';

  /**
   * The path to the source directory
   */
  sourcePath: string = 'src';

  /**
   * The path to the output directory
   */
  outputPath: string = 'out';

  /**
   * The current project base directory
   */
  private projectDirectory: string = '';

  /**
   * The current project format
   */
  private projectFormat: number = 3;

  /**
   * The loaded libraries on the project
   */
  private projectLibs: SimpleMap<Library> = {};

  /**
   * The loaded builds on the project
   */
  private projectBuilds: SimpleMap<Build> = {};

  /**
   * The loaded build targets on the project
   */
  private projectBuildTargets: SimpleMap<BuildTarget> = {};

  /**
   * Initializes a new project
   * @param projectDirectory The path to the current project's directory
   */
  constructor(
    projectDirectory: string,
  ) {
    this.projectDirectory = path.resolve(projectDirectory);
  }

  /**
   * Creates a project from a JSON object
   * @param projectDirectory The directory containing the project
   * @param projectJson The JSON object representing the project
   */
  static fromJSON(projectDirectory: string, projectJSON: any): Project {
    // Creates a new empty instance
    const project = new Project(projectDirectory);

    // Hydrates our instance
    project.name = projectJSON.name;
    project.description = projectJSON.description;
    project.sourcePath = projectJSON.sourcePath || 'src';
    project.outputPath = projectJSON.outputPath || 'out';
    project.projectFormat = projectJSON.cli?.fmtVersion || 1;

    // Parses libraries
    (projectJSON.libs as any[] || []).forEach((lib) => {
      project.registerLibrary(new Library(project, lib));
    });

    // Parses builds
    Object.keys(projectJSON.builds as any || {}).forEach((buildName) => {
      project.registerBuild(new Build(projectJSON.builds[buildName]));
    });

    // Parses build targets
    Object.keys(projectJSON.targets as any || {}).forEach((buildTargetName) => {
      project.registerBuildTarget(projectJSON.targets[buildTargetName] as BuildTarget);
    });

    // Returns our instance
    return project;
  }

  /**
   * Loads a project from a known disk location
   * @param projectDirectory The directory for our project
   */
  static load(projectDirectory: string): Project {
    // Checks if directory is valid
    if (!fs.existsSync(projectDirectory) || !fs.statSync(projectDirectory).isDirectory()) throw new Error('Invalid project directory!');

    // Checks if directory has a project
    const projectFile = path.join(projectDirectory, 'project.json');
    if (!fs.existsSync(projectFile)) throw new Error('Could not find a project file on specified directory!');

    // Reads our project file
    const projectFileContents = fs.readFileSync(projectFile).toString();

    // Tries parsing our file
    const projectJSON = JSON.parse(projectFileContents);

    // If parsing failed, notify user
    if (!projectJSON) throw new Error('Invalid project.json file!');

    // If everything succeeded, creates a new instance from the JSON object
    return this.fromJSON(projectDirectory, projectJSON);
  }

  /**
   * Gets the project version used for this program
   */
  getProjectFormat(): number {
    return this.projectFormat;
  }

  /**
   * Serializes the project into a JSON object
   */
  toJSON(): object {
    return {
      cli: {
        fmtVersion: this.getProjectFormat(),
      },
      name: this.name,
      description: this.description,
      sourcePath: this.sourcePath,
      outputPath: this.outputPath,
      builds: this.projectBuilds,
      targets: this.projectBuildTargets,
    };
  }

  /**
   * Gets the project's source directory
   */
  getSourceDirectory(): string {
    return path.join(this.projectDirectory, this.sourcePath);
  }

  /**
   * Gets the project's output directory
   */
  getOutputDirectory(): string {
    return path.join(this.projectDirectory, this.outputPath);
  }

  /**
   * Gets the project's library directory
   */
  getLibraryDirectory(): string {
    return path.join(this.projectDirectory, 'libs');
  }

  /**
   * Gets the project's utility directory
   */
  getUtilityDirectory(): string {
    return path.join(this.projectDirectory, 'util');
  }

  /**
   * Gets the project's base directory
   */
  getProjectDirectory(): string {
    return this.projectDirectory;
  }

  /**
   * Gets the project file
   */
  getProjectFile(): string {
    return path.join(this.projectDirectory, 'project.json');
  }

  /**
   * Gets the project entry-points
   */
  getProjectBuilds(): Build[] {
    return Object.values(this.projectBuilds);
  }

  /**
   * Gets the project build targets
   */
  getProjectBuildTargets(): BuildTarget[] {
    return Object.values(this.projectBuildTargets);
  }

  /**
   * Saves the current project object into disk
   */
  save() {
    fs.writeFileSync(
      this.getProjectFile(),
      JSON.stringify(this.toJSON(), null, 2)
    );
  }

  /**
   * Checks if a library is already registered
   * @param libraryId The ID of the library we are checking
   */
  hasLibrary(libraryId: string): boolean {
    return !!this.projectLibs[libraryId];
  }

  /**
   * Registers a library into the project
   * @param library The library being registered
   */
  registerLibrary(library: Library) {
    // Prevents inserting it twice
    if (this.hasLibrary(library.id)) throw new Error('Library has already been registered!');

    // Registers
    this.projectLibs[library.id] = library;
  }

  /**
   * Checks if a build has already been registered
   * @param buildName The name of the build we are checking
   */
  hasBuild(buildName: string): boolean {
    return !!this.projectBuilds[buildName];
  }

  /**
   * Registers a build into the project
   * @param build The build being registered
   */
  registerBuild(build: Build) {
    // Prevents inserting it twice
    if (this.hasBuild(build.name)) throw new Error('Build has already been registered!');

    // Registers our build
    this.projectBuilds[build.name] = build;
  }

  /**
   * Checks if a build target has already been registered
   * @param buildTargetName The name of the build target we are checking
   */
  hasBuildTarget(buildTargetName: string): boolean {
    return !!this.projectBuildTargets[buildTargetName];
  }

  /**
   * Registers a build target into the project
   * @param buildTarget The build target being registered
   */
  registerBuildTarget(buildTarget: BuildTarget) {
    // Prevents inserting it twice
    if (this.hasBuildTarget(buildTarget.name)) throw new Error('Build target has already been registered!');

    // Registers our build
    this.projectBuildTargets[buildTarget.name] = buildTarget;
  }
}