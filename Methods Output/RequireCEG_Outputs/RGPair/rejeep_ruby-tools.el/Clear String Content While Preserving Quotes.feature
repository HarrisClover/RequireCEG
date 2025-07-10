Feature: Clear String Content While Preserving Quotes

  As a user
  I want to clear content within double-quoted strings while preserving the quotes
  So that I can efficiently edit string content without accidental deletions

  Background:
    Given the user is positioned within double-quoted string
    And the user invokes the clear string content function

  Scenario: Clearing content within double quotes
    Given the string is 'Hello, "World!"'
    When the user clears the content
    Then the result should be '""'
    And the quotes should remain intact

  Scenario: Attempting to clear content within single quotes
    Given the string is 'Hello, "World!"'
    When the user tries to clear content within single quotes
    Then the result should be 'Hello, "World!"'
    And no action is taken and the string's integrity is maintained

  Scenario: Invalid Action when outside quotes
    Given the cursor is positioned outside of any string context
    When the user invokes the clear string content function
    Then the message should be 'Invalid action: Clear content is only allowed within double-quoted strings'

  Scenario Outline: Clearing content only when within double quotes
    Given the user is inside a double-quoted string "<text>"
    When the user executes the clear content function
    Then the result should be "" if <text> is present
    Examples:
      | text |
      | Sample Text |
      | Another example |
      | More text to clear |

