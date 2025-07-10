Feature: String and Symbol Manipulation in Ruby Tools
  As a Ruby programmer,
  I want to efficiently manipulate strings and symbols in Ruby code,
  So that I can quickly edit and manage string content in my code without errors.

  Scenario Outline: Clearing string content while maintaining quote marks
    Given that the string is <string>
    When the user clears the content of the string
    Then the string should remain as <expected-string>

    Examples:
      | string           | expected-string |
      | "Hello World"    | ""              |
      | "Test String"    | ""              |

  Scenario Outline: Interpolating variables in double-quoted strings
    Given that the string is "<string>"
    And the variable <variable> has value <value>
    When the user interpolates the variable in the string
    Then the string should become "<expected-string>"

    Examples:
      | string       | variable | value  | expected-string |
      | "Hello #{name}" | name     | John   | "Hello John"    |
      | "Age: #{age}"   | age      | 30     | "Age: 30"       |

  Scenario Outline: Preventing interpolation in single-quoted strings
    Given that the string is '<string>'
    And the variable <variable> has value <value>
    When the user tries to interpolate the variable in the string
    Then the string should remain "<expected-string>"

    Examples:
      | string       | variable | value  | expected-string |
      | 'Hello #{name}' | name     | John   | "Hello #{name}"  |
      | 'Age: #{age}'   | age      | 30     | "Age: #{age}"    |

  Scenario Outline: Converting between single and double-quoted strings
    Given that the string is <string>
    When the user converts the string to <quote-type>
    Then the string should become <expected-string>

    Examples:
      | string          | quote-type | expected-string   |
      | "Hello World"    | single     | 'Hello World'     |
      | 'Test String'    | double     | "Test String"     |

  Scenario Outline: Transforming between strings and symbols
    Given that the string is <string>
    When the user converts the string to a symbol
    Then the symbol should become <expected-symbol>

    Examples:
      | string      | expected-symbol |
      | "example"   | :example        |
      | "ruby"      | :ruby           |

  Scenario Outline: Handling empty strings
    Given that the string is "<string>"
    When the user processes the empty string
    Then the string should remain <expected-output>

    Examples:
      | string | expected-output |
      | ""     | ""              |
      | " "    | " "             |
