Feature: Repository Initialization and Management
As a developer or system administrator,
I want to initialize and manage repositories using a RESTful API
So that I can ensure proper repository creation, management, and error handling.

Scenario 1: Attempting to create a repository that already exists
Given that I am attempting to create a repository with an existing name
When I make the repository creation request
Then the system should return a 409 Conflict status
And the response should contain a JSON object with the failure reason indicating the repository already exists

Scenario 2: Attempting to create a repository with a parent directory
Given that I have the option to specify a parent directory when creating a repository
When I provide a parent directory along with the repository name
Then the system should successfully create the repository under the specified parent directory
And return a 201 Created status with repository details

Scenario 3: Attempting unsupported commands (e.g., renaming repositories)
Given that I am trying to issue an unsupported command such as renaming a repository
When I attempt to make a rename repository request
Then the system should return a 400 Bad Request status
And the response should indicate that renaming repositories is not available through the plugin

Scenario 4: Importing an existing repository with unavailable backend resolvers
Given that the backend resolvers required for the repository import are disabled
When I attempt to import the repository
Then the system should return a 400 Bad Request status
And the response should provide an explanation that the required resolver for the URI type is unavailable

Scenario 5: Successful import of an existing repository
Given that the backend resolvers are available for importing the repository
When I make a valid import request for an existing repository
Then the system should return a 200 OK status
And the response should contain the details of the newly imported repository in both XML and JSON formats

Scenario 6: Attempting to import a non-existent repository
Given that the repository does not exist in the system
When I try to import a non-existent repository
Then the system should return a 404 Not Found status
And the response should indicate that the repository does not exist

Scenario 7: Preventing creation of a repository that is already managed
Given that the repository is already managed by the system
When I attempt to create a new repository with the same name
Then the system should return a 409 Conflict status
And the response should contain an error message indicating that the repository already exists and is managed

