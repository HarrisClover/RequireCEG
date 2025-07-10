Feature: Headless Mode Execution Support

  As a user
  I want to validate first and last names via headless mode
  So that I can ensure the accuracy of user input before processing

  Background:
    Given the system is configured to use headless mode
    And the validation criteria for names are established

  Scenario: Scenario 1: Valid name input
    Given the user inputs a valid first name and last name
    When the system validates the names
    Then the system should accept the input
    And display a success message indicating successful validation

  Scenario: Scenario 2: Invalid character in name
    Given the user inputs a first name or last name with invalid characters
    When the system validates the names
    Then the system should reject the input
    And display an error message stating 'Invalid character in name'

  Scenario: Scenario 3: Name too short
    Given the user inputs a first name or last name that is too short
    When the system validates the names
    Then the system should reject the input
    And display an error message stating 'Name too short'

  Scenario: Scenario 4: Valid CSV input with access
    Given the system processes a CSV file with user entries
    And the input from the CSV file is accessible for validation
    When the system validates each entry in headless mode
    Then the system should return the definition for the term 'apple' or 'pear'
    And display logging of the validation result as successful

  Scenario: Scenario 5: CSV input with invalid character
    Given the system processes a CSV file with user entries
    And the file contains 'J@ne' as a first name and 'Smith' as a last name
    When the system validates each entry in headless mode
    Then the system should reject the input
    And log the validation result with an error message 'Invalid character in name'

  Scenario: Scenario 6: CSV input with name too short
    Given the system processes a CSV file with user entries
    And the file contains 'A' as a first name and 'B' as a last name
    When the system validates each entry in headless mode
    Then the system should reject the input
    And log the validation result with an error message 'Name too short'
