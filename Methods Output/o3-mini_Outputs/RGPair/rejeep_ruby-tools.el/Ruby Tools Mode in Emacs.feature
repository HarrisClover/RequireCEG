Feature: Ruby Tools Mode in Emacs
  In order to enhance productivity and code integrity for Ruby programmers
  As an Emacs user working with Ruby
  I want the Ruby tools mode to provide precise string manipulation and symbol conversion functionalities

  Scenario: Clearing string content while preserving quote marks
    Given a Ruby file is open in Emacs with a string "Hello, World!"
    When the user clears the content of the string
    Then the string remains as "" with the original starting and ending quote marks intact

  Scenario: Executing string interpolation in double-quoted strings and shell commands
    Given a Ruby file contains a double-quoted string "The total is #{total}"
    When Ruby tools mode processes the string interpolation
    Then the expression #{total} is evaluated correctly
    And when included in a shell command, the interpolation executes as expected

  Scenario: Preventing interpolation within single-quoted strings
    Given a Ruby file contains a single-quoted string 'The total is #{total}'
    When Ruby tools mode processes the string
    Then the content is treated as a literal string
    And no interpolation of #{total} is performed

  Scenario: Converting between single and double-quoted strings while preserving special characters
    Given a Ruby file has a string 'It costs $50.00' or "It costs $50.00"
    When the user requests conversion of the string
    Then the converted string preserves all special characters and maintains its structure

  Scenario: Transforming strings to symbols and symbols back again based on cursor position
    Given a Ruby file with a string "example" at the cursor position
    When the user invokes the conversion command
    Then the string "example" is transformed into its symbol representation :example
    And when the user requests the reverse operation, :example is converted back to "example"

  Scenario: Converting empty strings while maintaining structural integrity
    Given a Ruby file with an empty string represented as ""
    When Ruby tools mode converts the empty string to another format
    Then the resulting string remains empty with both starting and ending quotes intact

  Scenario: Automatic activation of Ruby tools mode upon entering Ruby mode
    Given Emacs is started and a Ruby file is loaded
    When the user enters Ruby mode
    Then Ruby tools mode activates automatically
