Feature: Prevent Interpolation in Single-Quoted Strings

  As a developer
  I want to ensure that single-quoted strings do not allow variable substitution
  So that I can avoid unintended behavior and ensure accurate string handling

  Background:
    Given a user uses Ruby tools mode
    And the input contains single-quoted strings

  Scenario: Scenario 1: Detection of Single Quotes with Interpolation
    Given the user inputs a single-quoted string containing a variable
    Then the system should display a warning message
    And suggest using double-quoted strings for variable substitution

  Scenario: Scenario 2: Literal Interpretation of Single-Quoted Strings
    Given the user executes a command containing a single-quoted string with interpolation
    When the command is processed
    Then the system treats the string literally
    And no interpolation occurs

  Scenario: Scenario 3: Prevent Interpolation in Non-Interpolative Context
    Given the user inputs a strictly literal single-quoted string
    Then the system should not display any warnings
    And the string should be processed without any transformations

  Scenario Outline: Scenario Outline: Validation of Single-Quoted Input
    Given the user inputs a single-quoted string '<input>'
    And the string contains an interpolation attempt '<interpolation>'
    When the system validates the string
    Then the system should return a validation warning
    Examples:
      | input | interpolation |
      | 'Hello, #{name}' | #{name} |
      | 'Total is #{total}' | #{total} |
      | 'The price is #{price}' | #{price} |

