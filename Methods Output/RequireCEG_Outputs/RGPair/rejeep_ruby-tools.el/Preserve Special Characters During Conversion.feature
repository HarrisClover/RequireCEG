Feature: Preserve Special Characters During Conversion

  As a user
  I want to convert strings and symbols while preserving special characters
  So that the integrity of the data is maintained during conversions

  Background:
    Given the system is ready for character conversion
    And the user has strings and symbols with special characters

  Scenario: Convert double-quoted string with special characters
    Given the user has a double-quoted string 'Hello, @User!'
    When the user converts this string
    Then the output should be 'Hello, @User!'
    And the special characters should remain unchanged

  Scenario: Convert single-quoted string with special characters
    Given the user has a single-quoted string 'Welcome to #2023!'
    When the user converts this string
    Then the output should be 'Welcome to #2023!'
    And the special characters should remain unchanged

  Scenario: Convert an empty string
    Given the user has an empty string
    When the user converts this string
    Then the output should be an empty string
    And the format should remain unchanged

  Scenario: Convert a string with special characters to a symbol
    Given the user has a string 'Data *With* Special & Characters!'
    When the user converts this string to a symbol
    Then the resultant symbol should be :Data *With* Special & Characters!
    And the special characters should be preserved

  Scenario: Convert a symbol back to a string
    Given the user has a symbol :Example $String!
    When the user converts this symbol back to a string
    Then the output should be 'Example $String!'
    And all special characters should remain unchanged

  Scenario: Convert double-quoted and single-quoted strings together
    Given the user has a double-quoted string 'Test @Example!' and a single-quoted string 'Check #2022!'
    When the user converts both strings
    Then the outputs should be 'Test @Example!' and 'Check #2022!'
    And the special characters should remain unchanged in both cases

  Scenario Outline: Convert mixed strings and symbols
    Given the user has a string '<my_string_with_specials>'
    And a symbol '<my_symbol_with_specials>'
    When the user converts these
    Then the output should be '<expected_output>'
    Examples:
      | my_string_with_specials | my_symbol_with_specials | expected_output |
      | 'Hello, @World!' | :Hello, @World! | 'Hello, @World!' |
      | 'Finally @2023!' | :Finally @2023! | 'Finally @2023!' |
      | 'Testing: #1$' | :Testing: #1$ | 'Testing: #1$' |

