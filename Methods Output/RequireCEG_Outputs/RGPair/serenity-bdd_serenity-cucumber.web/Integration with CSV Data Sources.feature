Feature: Integration with CSV Data Sources

  As a user
  I want to validate names against a CSV file
  So that I can ensure the names entered conform to the required standards

  Background:
    Given the CSV file contains first and last names
    And the system is ready to accept user input

  Scenario: Scenario 1: CSV file is empty
    Given the CSV file is empty
    When the user attempts to validate a name
    Then the system should display a message indicating that no data is available for validation

  Scenario: Scenario 2: Input consists of non-alphabetic characters
    Given the user inputs a name with non-alphabetic characters
    When the system validates the input
    Then the system should reject the input
    And provide an error message stating that only alphabetic characters are allowed

  Scenario: Scenario 3: Name exists in the CSV file
    Given the user inputs a valid name
    And the name exists in the CSV file
    When the system performs the validation
    Then the system should confirm successful validation
    And display a confirmation message

  Scenario: Scenario 4: Name does not exist in the CSV file
    Given the user inputs a valid name
    And the name does not exist in the CSV file
    When the system performs the validation
    Then the system should flag it as invalid
    And present an error message indicating that the name does not conform to the required standards

  Scenario: Scenario 5: Input contains only alphabetic characters but no match in CSV
    Given the user inputs a name that contains only alphabetic characters
    And the name does not exist in the CSV file
    When the system validates the input
    Then the system should flag it as invalid
    And present an error message indicating that the name does not conform to the required standards

  Scenario Outline: Scenario Outline: Validate names against CSV
    Given the CSV file contains <existing-names> names
    And the user inputs a name <input-name>
    When the system validates the name
    Then the system should <expected-outcome>
    Examples:
      | existing-names | input-name | expected-outcome |
      | valid | John Doe | confirm successful validation |
      | valid | Jane Smith | confirm successful validation |
      | valid | Invalid Name! | reject the input |
      | empty | Alice | display message indicating no data available for validation |

