Feature: Dynamic Name Input Tests

  As a user
  I want to validate my first and last name inputs
  So that I can ensure they meet the required criteria for successful registration

  Background:
    Given the user is on the registration page
    And the input fields for first name and last name are present

  Scenario: Scenario 1: First name is empty
    Given the last name is provided
    When the user tries to submit the form
    Then an error message stating that the first name is required will be displayed

  Scenario: Scenario 2: Last name is empty
    Given the first name is provided
    When the user tries to submit the form
    Then an error message indicating that the last name is required will be shown

  Scenario: Scenario 3: Both names exceed character limit
    Given the first name is 'Johnathan' and the last name is 'DoeDoeDoeDoe'
    When the user tries to submit the form
    Then an error message regarding the character limit will be displayed

  Scenario: Scenario 4: Invalid characters in names
    Given the first name contains invalid characters like '@' and last name is valid
    When the user tries to submit the form
    Then the first name input field will be highlighted
    And a warning message detailing acceptable character formats will be provided

  Scenario: Scenario 5: Valid names
    Given the first name is 'Alice' and last name is 'Smith'
    When the user submits the form
    Then both names will be accurately reflected in their respective fields
    And a confirmation message indicating successful validation will be displayed

  Scenario: Scenario 6: Search terms
    Given the user searches for 'apple'
    When the user requests the definition
    Then the system responds with an accurate definition of 'apple'

  Scenario: Scenario 7: Headless execution
    Given the system is running in headless mode
    When the user inputs valid names
    Then the validation process executes correctly

  Scenario: Scenario 8: Browser-based execution
    Given the system is running in browser mode
    When the user inputs valid names
    Then the validation process executes correctly

  Scenario Outline: Scenario Outline: Validate names from CSV
    Given valid names are present in the external CSV file
    When the system runs validation tests for each entry
    Then the system ensures correctness for all valid names
    Examples:
      | First Name | Last Name |
      | John | Doe |
      | Alice | Smith |
      | Bob | Marley |

