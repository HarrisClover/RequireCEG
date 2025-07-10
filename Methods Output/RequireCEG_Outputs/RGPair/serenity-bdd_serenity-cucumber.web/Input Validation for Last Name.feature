Feature: Input Validation for Last Name

  As a user submitting their last name
  I want to ensure that the last name meets validation criteria
  So that I can successfully submit my last name without errors

  Background:
    Given the last name input field is displayed
    And the validation rules are set

  Scenario: Scenario 1: Valid Input
    Given the last name input is 'Smith'
    When the user submits the last name
    Then the last name should be accepted
    And it should be displayed in the respective field

  Scenario: Scenario 2: Empty Input
    Given the last name input is empty
    When the user submits the last name
    Then an error message should be displayed stating 'Please provide a last name.'

  Scenario: Scenario 3: Special Characters
    Given the last name input is 'O'Reilly'
    When the user submits the last name
    Then an error message should be displayed stating 'Invalid input: last name cannot contain special characters.'

  Scenario: Scenario 4: Too Short Last Name
    Given the last name input is 'A'
    When the user submits the last name
    Then a warning message should be displayed stating 'Warning: last name may be too short.'

  Scenario: Scenario 5: Valid Input with Characters Only and Length Validation Passes, Log Action Taken
    Given the last name input is 'Smith'
    When the user submits the last name
    Then the last name should be accepted
    And it should be displayed in the respective field
    And log and report any detected errors from the external CSV file.

  Scenario Outline: Scenario Outline: Validate CSV Last Names
    Given the last name input is '<last-name>'
    When the system validates the last name from an external CSV file
    Then the last name should be '<result>'
    Examples:
      | last-name | result |
      | Johnson | accepted |
      | Smith@ | invalid |
      | A | warning |
      | O'Reilly | invalid |
      | Taylor | accepted |

