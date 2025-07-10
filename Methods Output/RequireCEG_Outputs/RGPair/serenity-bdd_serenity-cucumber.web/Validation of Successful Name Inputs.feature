Feature: Validation of Successful Name Inputs

  As a system user
  I want to ensure that my first and last names are valid
  So that I can successfully register my details in the system

  Background:
    Given a user is ready to input their names
    And the validation flag is set to true

  Scenario: Scenario 1: Valid first and last names
    Given the first name 'John'
    And the last name 'Doe'
    When the user submits the names
    Then the system should display a success message confirming that the names are valid
    And both names are valid

  Scenario: Scenario 2: Invalid first name
    Given the first name 'J'
    And the last name 'Smith'
    When the user submits the names
    Then the system should display an error message stating that the first name is invalid

  Scenario: Scenario 3: Invalid last name
    Given the first name 'Alice'
    And the last name 'S'
    When the user submits the names
    Then the system should display an error message stating that the last name is invalid

  Scenario: Scenario 4: Both names invalid
    Given the first name 'A'
    And the last name 'B'
    When the user submits the names
    Then the system should display a generic error message stating that both names must be valid

  Scenario: Scenario 5: First name is too short
    Given the first name 'A'
    And the last name 'Doe'
    When the user submits the names
    Then the system should display an error message indicating that the first name is too short

  Scenario: Scenario 6: Last name is too short
    Given the first name 'John'
    And the last name 'D'
    When the user submits the names
    Then the system should display an error message indicating that the last name is too short

  Scenario Outline: Scenario Outline: Name length checks
    Given the first name '<first-name>'
    And the last name '<last-name>'
    When the user submits the names
    Then the system should indicate that the first name is too short
    And the system should indicate that the last name is too short
    Examples:
      | first-name | last-name |
      | A | B |
      | AB | C |
      | A | BC |

