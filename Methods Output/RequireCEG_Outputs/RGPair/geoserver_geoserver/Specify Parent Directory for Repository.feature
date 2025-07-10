Feature: Specify Parent Directory for Repository

  As a user
  I want to create a repository within a specified parent directory
  So that I can manage my project files effectively

  Background:
    Given the user is authenticated into the system
    And the user has a clear definition of the repository name

  Scenario: Scenario 1: Valid Parent Directory and Unique Repository Name
    Given the specified directory exists
    And the proposed repository name is unique
    When the user attempts to create the repository
    Then the repository should be created successfully
    And the response should be '201 Created' with repository details in XML and JSON

  Scenario: Scenario 2: Invalid Parent Directory
    Given the specified directory does not exist
    When the user attempts to create the repository
    Then the system should respond with '400 Bad Request'
    And the message should be 'The specified directory is invalid.'

  Scenario: Scenario 3: Repository Name Already Exists
    Given the specified directory exists
    And the proposed repository name already exists
    When the user attempts to create the repository
    Then the system should respond with '409 Conflict'
    And the message should be 'The repository name is already taken.'

  Scenario: Scenario 4: Unsupported Command
    Given the user attempts to issue an unsupported command
    When the command is executed
    Then the system should return '400 Bad Request'
    And the message should be 'This command is not available.'

  Scenario: Scenario 5: Importing with Disabled Resolvers
    Given the necessary resolvers are disabled
    When the user attempts to import an existing repository
    Then the system should respond with '400 Bad Request'
    And the message should be 'Unhandled URI type.'

  Scenario: Scenario 6: Attempting to Create Repository in Invalid Directory
    Given the specified directory does not exist
    When the user attempts to create the repository
    Then the system should respond with '400 Bad Request'
    And the message should be 'The specified directory is invalid.'

  Scenario Outline: Scenario Outline: Create Repository with Various Directory and Name
    Given the specified directory is '<directory>'
    And the proposed repository name is '<repo-name>'
    When the user attempts to create the repository
    Then the expected response should be '<response>'
    Examples:
      | directory | repo-name | response |
      | Existing/valid_directory | unique_repo | 201 Created |
      | NonExisting/directory | repo_name | 400 Bad Request |
      | Existing/valid_directory | duplicate_repo | 409 Conflict |
      | Existing/valid_directory | unsupported_command | 400 Bad Request |

