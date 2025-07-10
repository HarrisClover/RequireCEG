Feature: Name Input and Validation

  As a user,
  I want to input and validate my first and last name,
  So that the system accepts only valid names and allows lookups for term definitions.

  Background: 
    Given the user is on the name input page

  Scenario: Successfully inputting valid first and last names
    Given the first name is "John"
    And the last name is "Doe"
    When the user submits the form
    Then the system should display "Name successfully submitted"

  Scenario: Failing to input an invalid first and last name
    Given the first name is "John"
    And the last name is "1234"
    When the user submits the form
    Then the system should display "Invalid last name"

  Scenario: Inputting empty first and last names
    Given the first name is ""
    And the last name is ""
    When the user submits the form
    Then the system should display "Both first and last names are required"

  Scenario Outline: Validating first and last names with external data (CSV)
    Given the first name is "<first-name>"
    And the last name is "<last-name>"
    When the user submits the form
    Then the system should display "<expected-outcome>"
    
    Examples:
      | first-name | last-name | expected-outcome        |
      | John       | Doe       | Name successfully submitted |
      | Alice      | 1234      | Invalid last name        |

  Scenario: Looking up the definition of terms
    Given the user is on the definition lookup page
    When the user searches for "apple"
    Then the system should display the definition of "apple"
    
    When the user searches for "pear"
    Then the system should display the definition of "pear"

  Scenario: Running tests in headless mode
    Given the user is using the HtmlUnit driver
    And the user is on the name input page
    When the user submits a valid name
    Then the system should validate the name successfully

  Scenario: Running tests in PhantomJS mode
    Given the user is using the PhantomJS driver
    And the user is on the name input page
    When the user submits a valid name
    Then the system should validate the name successfully
