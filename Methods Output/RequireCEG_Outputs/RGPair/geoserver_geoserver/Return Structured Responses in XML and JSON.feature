Feature: Repository Management and Error Handling

  As a developer
  I want to handle repository creation, import, and conflict scenarios effectively
  So that I can ensure proper management of repositories and provide informative error messages

  Background:
    Given the system is configured to manage repositories
    And error messages are defined for various scenarios

  Scenario: Existing Repository Conflict
    Given a user tries to create a repository that already exists
    When the system checks for the repository name
    Then the system returns a '409 Conflict' status
    And the response is JSON containing {'error': 'Repository already exists'}

  Scenario: Repository Name in Parent Directory Conflict
    Given a user tries to create a repository with a name that already exists in the specified parent directory
    When the system checks the parent directory
    Then the system returns a JSON response containing {'error': 'Repository name in parent directory already exists'}

  Scenario: Unsupported Command
    Given a user tries to rename a repository
    When the system processes the request
    Then the system returns a '400 Bad Request' response
    And the response includes {'error': 'Unsupported command: renaming not available'}

  Scenario: Import Repository with Disabled Resolvers
    Given the user attempts to import a repository
    When the necessary resolvers are disabled
    Then the system returns a '400 Bad Request'
    And the message is in JSON format: {'error': 'URI type unhandled'}

  Scenario: Successful Repository Import
    Given the user attempts to import an existing managed or unmanaged repository
    When the import action is successful
    Then the system returns a '200 OK' response
    And the details confirm the import in both XML and JSON formats

  Scenario: Nonexistent Repository Import
    Given a user tries to import a repository that does not exist
    When the system checks for the repository
    Then the system returns a JSON response containing {'error': 'Repository does not exist'}

  Scenario: Creating New Managed Repository
    Given a user tries to create a new repository that is already managed
    When the user submits the create request
    Then the system prevents the action
    And the response includes {'error': 'Cannot create a new repository; it is already managed'}

  Scenario: Existing Repository Import Check
    Given the user attempts to import an existing repository
    When the import action is checked for the existing state
    Then the system returns a '200 OK' consistent with a successful import
    And the response is informative

  Scenario: Nonexistent Repository Import Prevention
    Given the user tries to import a repository that does not exist
    When the import action is checked
    Then the system returns an error stating that the repository does not exist
    And the response contains correct messaging in JSON
