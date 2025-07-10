Feature: Last Name Input Validation

  As a user
  I want to input my last name in the system
  So that I can ensure my information is valid for processing

  Background:
    Given the input field for last name is displayed
    And the user can enter their last name

  Scenario: Scenario 1: Valid Last Name
    Given the user enters a valid last name
    When the user submits the form
    Then the input should be accepted
    And no error message should be displayed

  Scenario: Scenario 2: Invalid Last Name with Special Characters
    Given the user enters a last name with special characters
    When the user submits the form
    Then the system should display 'Invalid input: Last name must contain only alphabetic characters.'

  Scenario: Scenario 3: Empty Last Name
    Given the user leaves the last name input empty
    When the user submits the form
    Then the system should prompt 'Please enter a valid last name.'

  Scenario: Scenario 4: Last Name Exceeds Character Limit
    Given the user enters a last name exceeding the character limit
    When the user submits the form
    Then the system should display 'Last name exceeds the maximum character limit, please adhere to the constraints.'

  Scenario: Scenario 5: Last Name Exists in External CSV
    Given the user enters a last name that matches an entry in the CSV file
    When the user submits the form
    Then the system should validate this input against the external CSV file and respond accordingly based on predefined scenarios.

  Scenario: Scenario 6: Validity of Last Name Not Matches CSV
    Given the user enters a last name that does not match any entry in the CSV file
    When the user submits the form
    Then the system should process the validation and take action based on other defined rules.

  Scenario Outline: Scenario Outline: Various Last Name Inputs
    Given the user enters a last name '<last-name>'
    When the user submits the form
    Then the system should respond with '<response>'
    Examples:
      | last-name | response |
      | Smith | Accepted |
      | J@hn | Invalid input: Last name must contain only alphabetic characters. |
      |  | Please enter a valid last name. |
      | ABCDEFGHIJKLMNOPQRSTUVWXYZ | Last name exceeds the maximum character limit, please adhere to the constraints. |
      | Doe | Validated against CSV entries and responded accordingly |
      | Johnson | Processed but not matched in CSV entries. |

