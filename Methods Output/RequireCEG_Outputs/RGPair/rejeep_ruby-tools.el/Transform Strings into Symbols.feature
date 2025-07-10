Feature: Transform Strings into Symbols

  As a developer
  I want to convert strings to symbols and vice versa based on cursor position
  So that I can streamline the coding process for better efficiency

  Background:
    Given the input can be a string or a symbol
    And the cursor position is important for transformation

  Scenario: Scenario 1: Transforming a string into a symbol
    Given the input is a string within a Ruby code block
    And the cursor is positioned immediately after the string
    When the conversion is attempted
    Then the string should be converted into a symbol
    And the cursor position remains valid for further transformation

  Scenario: Scenario 2: Transforming a symbol into a string
    Given the input is a symbol
    And the cursor is positioned at the beginning of the symbol
    When the conversion is attempted
    Then the symbol should be transformed into a string

  Scenario: Scenario 3: Handling an empty string
    Given the input is an empty string
    When the conversion process is executed
    Then the system should maintain its structure while converting it to a symbol

  Scenario: Scenario 4: Special character handling in double-quoted strings
    Given the input is a double-quoted string
    When the conversion is attempted
    Then all special characters should remain intact during transformation

  Scenario: Scenario 5: Attempting to convert a single-quoted string
    Given the input is a single-quoted string
    When the conversion is attempted
    Then the system should present a message indicating that single-quoted strings cannot be converted

  Scenario: Scenario 6: Incorrect cursor position
    Given the input is a string or symbol
    And the cursor is not in an appropriate position for a transformation
    When the conversion is attempted
    Then the system should prompt the user to reposition the cursor correctly before attempting the conversion

  Scenario: Scenario 7: Checking transformation integrity
    Given the input is a string within a Ruby code block
    And the cursor is positioned immediately after the string
    When the conversion is attempted
    Then the transformation should ensure that the cursor position remains valid for further transformations
