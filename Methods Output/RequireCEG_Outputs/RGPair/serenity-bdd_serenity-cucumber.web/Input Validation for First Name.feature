Feature: Input Validation for First Name

  As a user
  I want to validate my first name input
  So that I can ensure it meets the required criteria

  Background:
    Given the system is ready to validate first name inputs
    And the validation checks are defined

  Scenario: Scenario 1: Missing First Name
    Given the first name input is empty
    When I submit the first name
    Then the system should prompt that the first name is required

  Scenario: Scenario 2: First Name with Special Characters
    Given the first name input contains special characters or numbers
    When I submit the first name
    Then the system should indicate that the first name must only contain alphabetic characters

  Scenario: Scenario 3: First Name Too Short
    Given the first name input is less than two characters
    When I submit the first name
    Then the system should display that the first name must be at least two characters long

  Scenario: Scenario 4: Valid First Name
    Given the first name input is 'John'
    When I submit the first name
    Then the system should confirm successful validation of the first name

  Scenario: Scenario 5: Prefined First Name with Definition
    Given the first name input is 'apple'
    When I submit the first name and request a definition
    Then the system should provide the definition of 'apple'

  Scenario: Scenario 6: Valid First Name for Alternate Condition
    Given the first name input is 'pear'
    When I submit the first name and request a definition
    Then the system should provide the definition of 'pear'

  Scenario Outline: Scenario Outline: First Name Validation
    Given the first name input is '<first-name>'
    When I submit the first name
    Then <expected-outcome>
    Examples:
      | first-name | expected-outcome |
      |  | the system should prompt that the first name is required |
      | A1 | the system should indicate that the first name must only contain alphabetic characters |
      | J | the system should display that the first name must be at least two characters long |
      | Mark | the system should confirm successful validation of the first name |
      | pear | the system should provide the definition of 'pear' |
      | apple | the system should provide the definition of 'apple' |

