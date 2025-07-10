Feature: Manage API Responses

  As a user
  I want to access the API securely based on my access type and key
  So that I can receive the appropriate permissions and access functionalities

  Background:
    Given a user attempts to access the API
    And the system checks the access type

  Scenario: Scenario 1: Free access type
    Given the access type is 'free'
    When the user attempts to access the API
    Then access is granted to the API
    And no further checks are performed

  Scenario: Scenario 2: Valid access key
    Given the access type is 'paid'
    And the access key is valid
    When the user attempts to access the API
    Then the permissions associated with the access key are retrieved
    And access is granted to the API functionality

  Scenario: Scenario 3: Expired access key
    Given the access type is 'paid'
    And the access key has expired
    When the user attempts to access the API
    Then access is denied
    And a message indicating that 'Access key expired.' is displayed

  Scenario: Scenario 4: Incorrect access key
    Given the access type is 'paid'
    And the access key is incorrect
    When the user attempts to access the API
    Then access is denied
    And an error message stating 'Credentials are wrong.' is displayed

  Scenario: Scenario 5: Incomplete access key check
    Given the access type is 'paid'
    And the access key is neither valid nor expired
    When the user attempts to access the API
    Then the system checks the validity of the access key
    And the permissions associated with the access key must be checked

  Scenario Outline: Scenario Outline: Access based on access key status
    Given the access type is '<access-type>'
    And the access key is '<access-key>'
    When the user attempts to access the API
    Then the access should be '<expected-access>'
    And the message should be '<expected-message>'
    Examples:
      | access-type | access-key | expected-access | expected-message |
      | free |  | granted | No further checks needed |
      | paid | valid-key | granted | Access granted |
      | paid | expired-key | denied | Access key expired. |
      | paid | invalid-key | denied | Credentials are wrong |

