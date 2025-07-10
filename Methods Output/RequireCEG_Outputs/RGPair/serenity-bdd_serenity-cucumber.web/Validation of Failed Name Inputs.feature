Feature: Validation of Failed Name Inputs

  As a user submitting their name
  I want to ensure that my first and last names are valid and meet the system requirements
  So that I can successfully submit my name information without errors

  Background:
    Given the input fields for first name and last name are present
    And the user is ready to enter their names

  Scenario: Scenario 1: First name contains numbers
    Given the user enters a first name with numbers
    When the user submits the form
    Then the system should display 'Error: First name cannot contain numbers or special characters.'

  Scenario: Scenario 2: Last name contains special characters
    Given the user enters a valid first name and an invalid last name with special characters
    When the user submits the form
    Then the system should display 'Error: Last name cannot contain numbers or special characters.'

  Scenario: Scenario 3: Names exceed 50 characters
    Given the user enters both first and last names that exceed 50 characters
    When the user submits the form
    Then the system should display 'Error: Names must be under 50 characters.'

  Scenario: Scenario 4: Empty name fields
    Given the user leaves one or both name fields blank
    When the user submits the form
    Then the system should display 'Error: Both first name and last name are required.'

  Scenario: Scenario 5: Valid names
    Given the user enters a valid first name and a valid last name
    When the user submits the form
    Then the system should reflect the valid names in their respective fields
    And the system should display 'Names entered successfully.'

  Scenario: Scenario 6: First name field is empty
    Given the user leaves the first name field blank
    When the user submits the form
    Then the system should display 'Error: Both first name and last name are required.'

  Scenario: Scenario 7: Last name field is empty
    Given the user leaves the last name field blank
    When the user submits the form
    Then the system should display 'Error: Both first name and last name are required.'

  Scenario Outline: Scenario Outline: Edge Cases for Name Validation
    Given the user enters a first name as '<first-name>'
    And the user enters a last name as '<last-name>'
    When the user submits the form
    Then the system should display '<expected-message>'
    Examples:
      | first-name | last-name | expected-message |
      | John123 | Doe | Error: First name cannot contain numbers or special characters. |
      | John | Doe@ | Error: Last name cannot contain numbers or special characters. |
      | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz | Doe | Error: Names must be under 50 characters. |
      | John |  | Error: Both first name and last name are required. |
      | Jane | Smith | Names entered successfully. |

