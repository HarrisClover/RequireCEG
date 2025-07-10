Feature: Import Unmanaged Existing Repository Successfully

  As a user
  I want to import an unmanaged existing repository
  So that I can successfully add it to the system

  Background:
    Given the necessary resolvers are enabled
    And the user has logged into the system

  Scenario: Scenario 1: Successful Import
    Given the repository to be imported exists
    When the user initiates the import process
    Then the system should return a '200 OK' response
    And the details of the new repository should be returned in both XML and JSON formats

  Scenario: Scenario 2: Import with Resolvers Disabled
    Given the necessary resolvers are disabled
    When the user attempts to import the unmanaged repository
    Then the system should return a '400 Bad Request' response
    And the response should indicate that the URI type is unhandled

  Scenario: Scenario 3: Importing a Non-existent Repository
    Given the repository to be imported does not exist
    When the user tries to import the repository
    Then the system should return a '404 Not Found' error
    And the response should state that the repository could not be found

  Scenario: Scenario 4: Creating an Already Managed Repository
    Given the repository already exists in the managed state
    When the user attempts to create the repository
    Then the system should return a '409 Conflict'
    And the response should specify that the repository name is currently in use

  Scenario: Scenario 5: Import with Resolvers Disabled (Negative Case)
    Given the necessary resolvers are disabled
    When the user attempts to import an unmanaged existing repository
    Then the system should return a '400 Bad Request' response
    And the response should indicate that the URI type is unhandled

  Scenario: Scenario 6: Trying to Import Without Necessary Resolvers Active
    Given the necessary resolvers are not enabled
    When the user attempts to import a repository
    Then the system should return a '400 Bad Request' response
    And the message should indicate that import cannot proceed because resolvers are not active

  Scenario: Scenario 7: Import Non-existent Repository
    Given the repository to be imported does not exist
    When the user attempts to import the repository
    Then the system should return a '404 Not Found' error
    And the response should specify that the repository could not be found

  Scenario: Scenario 8: Handling the Attempt for a Managed Repository
    Given the repository already exists as a managed repository
    When the user attempts to create the repository again
    Then the system should return a '409 Conflict'
    And the response should clarify that the repository name is currently in use
