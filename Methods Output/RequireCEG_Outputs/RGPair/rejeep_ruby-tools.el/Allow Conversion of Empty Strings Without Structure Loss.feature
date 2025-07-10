Feature: Allow Conversion of Empty Strings Without Structure Loss

  As a Ruby developer
  I want to convert empty strings without losing their structure
  So that I can enhance my editing experience without compromising code integrity

  Background:
    Given the user has an empty string in the code
    And the cursor is positioned at a specific location within the string

  Scenario: Cursor at the beginning of the empty string
    Given the cursor is at the beginning of the empty string
    When the user attempts to convert the empty string to a symbol
    Then the empty string should convert to a symbol while preserving its structure
    And visual confirmation should be provided that the original structure of the empty string has been maintained

  Scenario: Cursor at the end of the empty string
    Given the cursor is at the end of the empty string
    When the user attempts to convert the empty string to a symbol
    Then the empty string should convert to a symbol while preserving its structure
    And visual confirmation should be provided that the original structure of the empty string has been maintained

  Scenario: Cursor in the middle of the empty string
    Given the cursor is positioned in the middle of double quotes containing an empty string
    When the user attempts to convert the empty string
    Then the empty string should remain in double quotes
    And the structure of the string should remain unchanged

  Scenario: Converting single quotes to double quotes
    Given the user has an empty string in single quotes
    When the user attempts to convert it to double quotes
    Then the empty string should be converted to double quotes
    And the original quote marks should be retained

  Scenario: Converting double quotes to single quotes
    Given the user has an empty string in double quotes
    When the user attempts to convert it to single quotes
    Then the empty string should be converted to single quotes
    And the original quote marks should be retained

  Scenario Outline: Scenario Outline: Handling Conversion Requests
    Given the cursor is positioned at <position> of the string '<string>'
    When the user converts the string
    Then the string should convert to '<result>'
    Examples:
      | position | string | result |
      | beginning |  | :symbol |
      | end |  | :symbol |
      | middle | "" | "" |
      | single | '' | "" |
      | double | "" | '' |

