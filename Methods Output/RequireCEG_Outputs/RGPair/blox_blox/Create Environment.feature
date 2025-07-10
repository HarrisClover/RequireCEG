Feature: Create Environment

  As a user
  I want to create an environment in a specified cluster
  So that I can manage my resources effectively

  Background:
    Given the user has access to multiple clusters
    And the user has the necessary permissions to create environments

  Scenario: Scenario 1: Successful environment creation
    Given the user specifies an environment name that does not exist in the chosen cluster
    And the user selects a valid existing cluster
    When the user attempts to create the environment
    Then the system displays 'Environment created successfully.'

  Scenario: Scenario 2: Environment already exists
    Given the user specifies an environment name that already exists in the selected cluster
    When the user attempts to create the environment
    Then the system displays 'Error: The environment already exists in this cluster.'

  Scenario: Scenario 3: Successful creation in a new cluster
    Given the user specifies an environment name that does not exist
    And the user selects a different valid cluster
    When the user attempts to create the environment
    Then the system displays 'Environment created successfully in a new cluster.'

  Scenario: Scenario 4: Invalid cluster specified
    Given the user specifies a cluster that does not exist
    When the user attempts to create the environment
    Then the system displays 'Error: Invalid cluster specified.'

  Scenario: Scenario 5: Logging revisions during creation
    Given the user specifies an environment name that does not exist
    And the user selects a valid existing cluster
    When the user makes revisions during the environment creation
    Then the system displays 'Environment created successfully.'
    And the system logs the revisions with 'Revisions captured: [details of revisions]'

  Scenario: Scenario 6: Environment creation with invalid cluster
    Given the user specifies an environment name that does not exist
    And the user selects a cluster that does not exist
    When the user attempts to create the environment
    Then the system displays 'Error: Invalid cluster specified.'

  Scenario: Scenario 7: Revisions must be logged
    Given the user specifies an environment name that does not exist
    And the user selects a valid existing cluster
    When the user makes revisions during the environment creation
    Then the system displays 'Environment created successfully.'
    And the system logs the revisions as required.
