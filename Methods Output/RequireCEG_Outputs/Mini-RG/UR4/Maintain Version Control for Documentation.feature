Feature: Maintain Version Control for Documentation

  As a user of the web app
  I want to access user documentation and its versions
  So that I can understand how to use the web app effectively

  Background:
    Given that user documentation is available
    And the documentation page is accessible

  Scenario: Scenario 1: Documentation is available and understandable
    Given the user accesses the documentation page
    When the documentation is displayed
    Then the user finds the documentation easy to understand
    And the user successfully learns how to use the web app

  Scenario: Scenario 2: Documentation is not available
    Given the user accesses the documentation page
    When the documentation is not found
    Then the user sees the message 'User documentation is not available, please contact support.'

  Scenario: Scenario 3: User requests the latest version of documentation
    Given the user accesses the documentation with multiple versions
    When the user requests the latest version
    Then the system provides access to the latest version of the documentation
    And the user can view previously archived versions of the documentation

  Scenario: Scenario 4: User checks change history of documentation
    Given the user accesses the documentation page
    When the user wants to view the change history
    Then the user can view the change history of the documentation

  Scenario Outline: Scenario Outline: Documentation is down
    Given the documentation page is <status>
    When the user attempts to access the documentation
    Then the user receives a response regarding documentation availability
    Examples:
      | status | response |
      | available | documentation is displayed |
      | down | User documentation is not available, please contact support. |
      | not_found | User documentation is not available, please contact support. |

