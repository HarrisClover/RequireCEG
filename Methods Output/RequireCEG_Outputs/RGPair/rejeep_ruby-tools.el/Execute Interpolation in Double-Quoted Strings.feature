Feature: Execute Interpolation in Double-Quoted Strings

  As a user of the Ruby code editor
  I want to use variable interpolation within double-quoted strings correctly
  So that I can evaluate and display variable values in my strings accurately

  Background:
    Given the presence of variables defined in the system
    And a user is editing a Ruby code snippet containing double-quoted strings

  Scenario: Scenario 1: Successful interpolation
    Given the variable user_name is defined as 'Alice'
    When the user inputs the string "Hello, #{user_name}!"
    Then the output should be 'Hello, Alice!'
    And the system should display the interpolated result correctly

  Scenario: Scenario 2: Undefined variable
    Given the variable foo is not defined
    When the user inputs the string "Value of foo is #{foo}"
    Then the output should be 'Variable not defined: foo'

  Scenario: Scenario 3: Single quote string without interpolation
    Given the variable bar is defined as '10'
    When the user inputs the string 'Value of bar is #{bar}'
    Then the output should be 'Value of bar is #{bar}'

  Scenario: Scenario 4: Interpolation with special characters
    Given a user defines a variable x as "50%"
    And a user defines a variable y as "Hello, #{name}!" where name is "World"
    When the user inputs the string "Discount: #{x}, Greeting: #{y}"
    Then the output should be "Discount: 50%, Greeting: Hello, World!"

  Scenario: Scenario 5: Successful single-quoted string preservation
    Given the variable single_quoted_string is defined as 'This is a string'
    When the user inputs the string 'Value: #{single_quoted_string}'
    Then the output should be 'Value: #{single_quoted_string}'
