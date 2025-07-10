Feature: Activate Ruby Tools Mode Upon Entering Ruby Mode

  As a Ruby developer
  I want the system to automatically activate Ruby Tools Mode when I enter Ruby mode
  So that I can access enhanced productivity features specifically designed for Ruby development

  Background:
    Given the user opens a Ruby file
    And the system is in Ruby Tools Mode

  Scenario: Scenario 1: String Manipulation
    Given the user attempts to edit a string
    Then the system presents options to clear the content while preserving the quote marks
    And the user can choose to edit as needed

  Scenario: Scenario 2: String Interpolation in Double Quotes
    Given the user has a double-quoted string with interpolation
    When the user triggers string interpolation
    Then the system ensures that the interpolation executes correctly

  Scenario: Scenario 3: Prevent Interpolation in Single Quotes
    Given the user has a single-quoted string
    When the user tries to perform string interpolation
    Then the system prevents any interpolation from occurring

  Scenario: Scenario 4: Conversion Between String and Symbol
    Given the user is working with a string or symbol
    When the user initiates a transformation
    Then the system facilitates the transformation while respecting the cursor's position

  Scenario Outline: Scenario Outline: Empty String Handling
    Given the user is working with an empty string
    When the user requests format conversion
    Then the system supports the conversion while keeping the original structure intact
    Examples:
      | action | initialFormat | desiredFormat | outcome |
      | convert | empty string | symbol | empty symbol |
      | transform | empty string | double-quoted string | maintained empty string with quotes |

