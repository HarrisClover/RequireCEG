Feature: Retrieve Data from API

  As a user with an API access key
  I want to retrieve data from the API with proper authorization
  So that I can access the needed resources based on my permissions

  Background:
    Given the user has an API access key
    And the access key's validity must be checked

  Scenario: Scenario 1: Valid Access Key
    Given the access key is valid
    And the access key is not expired
    When the user requests to retrieve data from the API
    Then the user should successfully retrieve data
    And no error message should be shown

  Scenario: Scenario 2: Expired Access Key
    Given the access key is valid
    And the access key has expired
    When the user attempts to retrieve data from the API
    Then the system should present an error message stating 'Access key has expired.'

  Scenario: Scenario 3: Invalid Access Key
    Given the access key is invalid
    When the user tries to access the API
    Then the system should respond with 'Access key is invalid.'

  Scenario: Scenario 4: Insufficient Permissions
    Given the access key is valid
    And the user lacks the necessary permissions
    When the user tries to retrieve restricted data from the API
    Then the user should receive a message indicating 'Insufficient permissions to access the API.'

  Scenario: Scenario 5: Invalid Key Condition Check with Valid Key Status Check and Insufficient Permissions Check. It Enforces Expired Condition too.
    Given the access key is valid
    And the access key is not expired
    And the user has insufficient permissions
    When the user attempts to retrieve data from the API
    Then the system should respond with 'Insufficient permissions to access the API.'

  Scenario Outline: Scenario Outline: Access Check
    Given the access key status is <key-status>
    And the access permissions are <permissions>
    When the user requests to retrieve data
    Then the outcome should be <outcome>
    Examples:
      | key-status | permissions | outcome |
      | valid and not expired | sufficient | successfully retrieve data |
      | valid but expired | any | Access key has expired. |
      | invalid | any | Access key is invalid. |
      | valid and not expired | insufficient | Insufficient permissions to access the API. |

