Feature: Integration with HtmlUnit and PhantomJS Drivers

  As a system validator
  I want to validate first and last name inputs against specific rules
  So that I can ensure that only valid names are accepted

  Background:
    Given the names to be validated from a CSV file
    And the validation rules are defined

  Scenario: First name is empty
    Given the first name input is empty
    Then an error message 'First name is required' should be displayed

  Scenario: Last name is empty
    Given the last name input is empty
    Then an error message 'Last name is required' should be displayed

  Scenario: First name contains special characters
    Given the first name input contains special characters
    Then an error message 'Only letters are allowed' should be displayed

  Scenario: Last name contains special characters
    Given the last name input contains special characters
    Then an error message 'Only letters are allowed' should be displayed

  Scenario: Valid names entered
    Given both first and last names are valid
    Then a confirmation message 'Names entered successfully' should be displayed

  Scenario: Definition lookup for apple
    Given the name entry includes 'apple'
    When a lookup request is made
    Then the system should respond with the definition of 'apple'

  Scenario: Definition lookup for pear
    Given the name entry includes 'pear'
    When a lookup request is made
    Then the system should respond with the definition of 'pear'

  Scenario: Headless validation with HtmlUnit
    Given the system is using the HtmlUnit driver
    When the names are validated
    Then the appropriate error messages should be displayed without a browser window

  Scenario: Headless validation with PhantomJS
    Given the system is using the PhantomJS driver
    When the names are validated
    Then the appropriate error messages should be displayed in headless mode

  Scenario Outline: Data-driven validation of names
    Given the name is '<name>'
    When the system validates the name
    Then the outcome should be '<expected-outcome>'
    Examples:
      | name | expected-outcome |
      | John Doe | Names entered successfully |
      |  | First name is required |
      | 123 | Only letters are allowed |
      | Jane-!Doe | Only letters are allowed |

