Feature: Browser-Based Execution Mode Support

  As a user
  I want to verify name inputs and request definitions
  So that I can ensure my input is valid and receive accurate information

  Background:
    Given the system is running
    And a user is logged into the System

  Scenario: Valid Name Input
    Given the user enters a valid first name and last name
    When the user submits the name
    Then the system should display a confirmation message indicating successful validation

  Scenario: Invalid Name Format
    Given the user enters a name containing numbers or special characters
    When the user submits the name
    Then the system should present an error message stating 'Invalid name format.'

  Scenario: Empty Name Field
    Given the user leaves the name field blank
    When the user attempts to submit the name
    Then the system should prompt 'Name cannot be empty.'

  Scenario: Request Definition of Term 'Apple'
    Given the user requests a definition for the term 'apple'
    When the system processes the request
    Then the system should respond with an accurate description for 'apple'

  Scenario: Request Definition of Term 'Pear'
    Given the user requests a definition for the term 'pear'
    When the system processes the request
    Then the system should respond with an accurate description for 'pear'

  Scenario Outline: CSV Name Entry Validation
    Given the system reads name entries from an external CSV file
    And the name entry is '<name>'
    When the system validates the name
    Then the system should log whether the entry was a successful validation or failed based on the predefined criteria
    Examples:
      | name |
      | John Doe |
      | Jane123 |
      | Alice Smith |
      |  |
      | !@#Remark |

