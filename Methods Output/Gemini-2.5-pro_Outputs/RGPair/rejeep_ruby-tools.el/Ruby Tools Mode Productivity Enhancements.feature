Feature: Ruby Tools Mode Productivity Enhancements
  As a Ruby programmer using Emacs
  I want tools to easily manipulate Ruby strings and symbols
  So that I can edit Ruby code more efficiently and with fewer errors

  Background:
    Given I am in Emacs
    And the Ruby Tools Mode is installed

  Scenario: Automatic Activation on Entering Ruby Mode
    When I open a file with a `.rb` extension
    Or I manually switch to Ruby mode
    Then the Ruby Tools Mode should be active
    And its specific commands should be available

  Scenario Outline: Clear String Content Maintaining Quotes
    Given I am in Ruby mode with the Ruby Tools active
    And my buffer contains the code `<initial_code>`
    And my cursor is positioned within the string in the code
    When I invoke the "clear string content" command
    Then the code should become `<expected_code>`

    Examples:
      | description          | initial_code         | expected_code  |
      | Double Quoted String | `puts "hello world"` | `puts ""`       |
      | Single Quoted String | `puts 'hello world'` | `puts ''`       |
      | Empty Double String  | `puts ""`            | `puts ""`       |
      | Empty Single String  | `puts ''`            | `puts ''`       |
      | String Assignment    | `my_var = "content"` | `my_var = ""`  |

  Scenario Outline: Convert String Quote Type
    Given I am in Ruby mode with the Ruby Tools active
    And my buffer contains the code `<initial_code>`
    And my cursor is positioned within the string in the code
    When I invoke the "convert string quote type" command
    Then the code should become `<expected_code>`

    Examples: Preserve Characters and Structure
      | description                       | initial_code              | expected_code             |
      | Double to Single (Simple)         | `puts "simple"`           | `puts 'simple'`           |
      | Single to Double (Simple)         | `puts 'simple'`           | `puts "simple"`           |
      | Double to Single (Escape needed)  | `puts "with ' quote"`     | `puts 'with \' quote'`    |
      | Single to Double (Escape needed)  | `puts 'with " quote'`     | `puts "with \" quote"`    |
      | Double to Single (Interpolation)  | `puts "interpolate #{x}"` | `puts 'interpolate #{x}'` | # Characters preserved, Ruby meaning changes
      | Single to Double (Literal interp) | `puts 'literal #{x}'`     | `puts "literal #{x}"`     | # Characters preserved
      | Single to Double (Unescape needed)| `puts 'don\'t'`           | `puts "don't"`            |
      | Empty Double to Single            | `puts ""`                 | `puts ''`                 |
      | Empty Single to Double            | `puts ''`                 | `puts ""`                 |

  Scenario Outline: Convert Between String and Symbol
    Given I am in Ruby mode with the Ruby Tools active
    And my buffer contains the code `<initial_code>`
    And my cursor is positioned appropriately on the string or symbol
    When I invoke the "convert string/symbol" command
    Then the code should become `<expected_code>`

    Examples: String/Symbol Transformation
      | description                   | initial_code       | expected_code      |
      | Double Quoted String to Symbol| `x = "my_string"`  | `x = :my_string`   |
      | Single Quoted String to Symbol| `y = 'my_string'`  | `y = :my_string`   |
      | Simple Symbol to String       | `z = :my_symbol`   | `z = "my_symbol"`  | # Assuming default to double quotes
      | String Hash Key to Symbol Key | `h = {"key" => 1}` | `h = {:key => 1}`  |
      | Symbol Hash Key to String Key | `h = {:key => 1}`  | `h = {"key" => 1}` |
      | Quoted Symbol to String       | `m = :"sym-bol"`   | `m = "sym-bol"`    |
      | String needing Symbol Quotes  | `m = "sym-bol"`    | `m = :"sym-bol"`   |
      | Empty Double String to Symbol | `x = ""`           | `x = :""`          |
      | Empty Single String to Symbol | `y = ''`           | `y = :""`          | # Standard empty symbol is :""
      | Empty Symbol to String        | `z = :""`          | `z = ""`           |