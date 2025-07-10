Feature: Restrict Interpolation Outside of String Contexts

  As a developer
  I want to ensure that string interpolation occurs only within double-quoted strings
  So that I can prevent unintended modifications or execution of string content

  Background:
    Given the system checks the cursor's position
    And determines if it is within a double-quoted string or single-quoted string

  Scenario: Cursor inside double-quoted string
    Given the cursor is positioned within a double-quoted string
    When the system performs string interpolation
    Then the variable expressions are replaced with their corresponding values
    And the resulting string is rendered for display

  Scenario: Cursor inside single-quoted string
    Given the cursor is positioned within a single-quoted string
    When the system evaluates the string
    Then the string is displayed exactly as inputted
    And no interpolation is performed

  Scenario: Cursor outside any string context
    Given the cursor is positioned outside any string context
    When the system processes the input
    Then there is no interpolation performed
    And the content remains unchanged

  Scenario: Mutual Exclusion of String Contexts
    Given the cursor is positioned within a double-quoted string
    And the cursor is positioned within a single-quoted string
    Then both string contexts cannot be active simultaneously

  Scenario: Required Dependency of Evaluating Contexts
    Given the cursor is positioned within a double-quoted string
    And the cursor is positioned outside any string context
    Then string interpolation should only occur when within a string context
