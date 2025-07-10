Feature: Manage Transformations Based on Cursor Position

  As a user interacting with the string transformation system
  I want to be able to transform double-quoted strings into symbols while preserving the quotes
  So that I can manipulate strings more efficiently and intuitively

  Background:
    Given the user is interacting with a text editor
    And the cursor is positioned within a string

  Scenario: Transform double-quoted string to symbol
    Given the cursor is inside a double-quoted string
    When the user requests a transformation to a symbol
    Then the string is converted to symbol format
    And the double quotes remain intact

  Scenario: Prevent transformation in single-quoted string
    Given the cursor is inside a single-quoted string
    When the user attempts to transform the string to a symbol
    Then the transformation is not allowed
    And a message is displayed stating 'Transformations to symbols are not allowed within single-quoted strings.'

  Scenario: Allow transformation of empty string
    Given the cursor is at the beginning of an empty string
    When the user requests a transformation
    Then the empty string is converted to its respective format without altering its structure

  Scenario: Indicate state when moving between strings
    Given the cursor is moved between a double-quoted string and a single-quoted string
    When the user changes the cursor position
    Then the system indicates 'in double-quoted string' or 'in single-quoted string'
    And facilitates easy switching of transformations

  Scenario: Transform special characters in double-quoted string
    Given the cursor is positioned inside a double-quoted string containing special characters '<special-characters>'
    When the user transforms the string
    Then the special characters are maintained during the transformation
    And the double quotes remain intact

  Scenario: Detect cursor position change between quoted strings
    Given the cursor is moved between double and single-quoted strings
    When the user checks the current cursor position
    Then the system indicates 'in double-quoted string' or 'in single-quoted string'
    And the system facilitates easy switching of transformations
