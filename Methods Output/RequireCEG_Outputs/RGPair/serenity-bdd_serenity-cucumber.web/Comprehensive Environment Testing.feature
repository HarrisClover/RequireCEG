Feature: User Input Validation and CSV Upload Functionality

  As a system user
  I want to validate my first and last names and upload CSV files to ensure data integrity
  So that I can receive appropriate feedback on my input and maintain a clean database

  Background:
    Given the system is functioning correctly
    And the user has access to the input fields and CSV upload feature

  Scenario: Valid first and last names
    Given the user enters a first name 'John' and a last name 'Doe'
    When the user submits the names
    Then the system updates the first and last name fields
    And the system presents a success message confirming the validation

  Scenario: First name exceeds character limit
    Given the user enters a first name that is 51 characters long
    When the user submits the name
    Then the system displays the message 'First name must be 50 characters or fewer.'

  Scenario: Last name contains invalid characters
    Given the user enters a last name 'Doe!@#'
    When the user submits the name
    Then the system displays the message 'Last name contains invalid characters.'

  Scenario: CSV file upload with valid names
    Given the user uploads a CSV file containing valid names 'John Doe', 'Alice Smith'
    When the system processes the file
    Then the system generates success messages for each valid name.

  Scenario: CSV file upload with invalid names
    Given the user uploads a CSV file containing 'John Doe', 'Invalid#Name'
    When the system processes the file
    Then the system generates a detailed error report for invalid entries.

  Scenario: Request for definition of 'apple'
    Given the user requests a definition for the term 'apple'
    When the system processes the request
    Then the system returns an accurate description of 'apple'.

  Scenario: Request for definition of 'pear'
    Given the user requests a definition for the term 'pear'
    When the system processes the request
    Then the system returns an accurate description of 'pear'.

  Scenario: Validate first name and last name together
    Given the user enters a first name 'John' and a last name 'Doe'
    When the user submits the names
    Then the system updates the name fields with valid first and last names.
    And the system displays a success message confirming the validation.

  Scenario: CSV upload first name valid and last name invalid
    Given the user uploads a CSV file containing 'John Doe', 'Alice Invalid#Name'
    When the system processes the file
    Then the system generates a success message for 'John Doe' and a detailed error report for 'Alice Invalid#Name'.

  Scenario: Input for definition without valid request
    Given the user does not request a definition for 'apple' or 'pear'
    When the user makes a request
    Then the system does not return any definition.
