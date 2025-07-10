Feature: First Name Input Field

  As a user
  I want to input my first name
  So that the system can validate and accept it

  Background:
    Given the user is on the registration page
    And the input field for the first name is visible

  Scenario: Scenario 1: First name is required
    Given the input field is empty
    When the user submits the form
    Then the system displays 'First name is required.'

  Scenario: Scenario 2: Input contains non-alphabetic characters
    Given the user enters 'John123'
    When the user submits the form
    Then the system displays 'Input must only contain alphabetic characters.'

  Scenario: Scenario 3: Name exceeds character limit
    Given the user enters a name longer than 50 characters
    When the user submits the form
    Then the system displays 'Name must not exceed 50 characters.'

  Scenario: Scenario 4: Valid first name
    Given the user enters 'Alice'
    When the user submits the form
    Then the system displays 'First name accepted.'

  Scenario: Scenario 5: Offensive first name
    Given the user enters an offensive name
    When the user submits the form
    Then the system displays a warning message about acceptable names.

  Scenario: Scenario 6: First Name has special symbols
    Given the user enters 'John@Doe'
    When the user submits the form
    Then the system displays 'Input must only contain alphabetic characters.'

  Scenario: Scenario 7: Invalid character usage
    Given the user enters 'John!@#'
    When the user submits the form
    Then the system displays 'Input must only contain alphabetic characters.'
