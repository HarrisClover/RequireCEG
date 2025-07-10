Feature: Ruby Tools Mode

  As a Ruby programmer
  I want to enhance productivity by manipulating strings and symbols within Ruby code
  So that I can simplify the editing process and reduce errors during coding

  Background:
    Given the Ruby tools mode activates automatically upon entering Ruby mode
    And users can clear string content while maintaining the original quote marks

  Scenario: Scenario 1: Clear string content
    Given the user has a non-empty string with content
    When the user clears the string
    Then the string content is cleared
    And the original quote marks are maintained

  Scenario: Scenario 1.1: Clear empty string
    Given the user has an empty string
    When the user tries to clear the string
    Then the string remains empty
    And the original quote marks are maintained

  Scenario: Scenario 2: String interpolation in double quotes
    Given the user has a double-quoted string with variables defined
    When the user executes the string
    Then the variables are interpolated correctly

  Scenario: Scenario 3: Prevent interpolation in single quotes
    Given the user has a single-quoted string with variables defined
    When the user executes the string
    Then the variables are not interpolated

  Scenario Outline: Scenario Outline: String and Symbol Transformation
    Given the user has a string <string>
    When the user transforms the string into a symbol
    Then the string is transformed into a symbol
    And the cursor position is adjusted appropriately based on the transformation
    Examples:
      | string | position |
      | Hello World | start |
      | Ruby | end |
      | Example String | middle |
      | !@#$%^&*() | start |
      |  | end |

