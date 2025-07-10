Feature: Input and Validation of Names

  As a user
  I want to input and validate first and last names
  So that I can ensure that the data conforms to required standards

  Background:
    Given the system supports name entry and validation
    And the system can execute tests across various web drivers

  Scenario: Scenario 1: Successful Name Entry
    Given the user navigates to the name input page
    When the user enters a valid first name and last name
    Then the system should accept the input without errors
    And the name fields should reflect the entered names

  Scenario: Scenario 2: Invalid Name Entry
    Given the user navigates to the name input page
    When the user enters an invalid first name and last name
    Then the system should reject the input with error messages

  Scenario Outline: Scenario Outline: Name Entry Validation
    Given the user is on the name input page
    When the user submits the name
    Then the system should <validation-result>
    Examples:
      | first-name | last-name | validation-result |
      | John | Doe | accept the input without errors |
      |  | Smith | reject the input with error messages |
      | Jane |  | reject the input with error messages |
      | 1234 | User | reject the input with error messages |
      | !@#$ | User | reject the input with error messages |
      | Anne Marie | O'Neill | accept the input without errors |
      | FirstName | Last Name | accept the input without errors |

