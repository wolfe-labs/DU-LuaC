import path from "path";
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
      this.type = LibraryType.Project;
    } catch (err) {
      this.type = LibraryType.Raw;
    }
  }
}