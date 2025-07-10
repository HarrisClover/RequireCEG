Feature: Hiding Family Name Field After First Name Entry

  As a user filling out a form
  I want the family name field to be hidden after entering my first name
  So that I can complete the form without the need for a family name input

  Background:
    Given the user is on the registration form page
    And the family name input field is visible

  Scenario: Scenario 1: Hiding Family Name Field upon Entry of First Name
    Given the first name input field is focused
    When the user enters 'John' into the first name input field
    Then the family name input field should be hidden
    And the user cannot interact with the family name input field

  Scenario: Scenario 2: Attempting to Enter Family Name After Hiding
    Given the first name input field contains 'John'
    When the user tries to enter 'Doe' into the family name input field
    Then the family name input field remains hidden

  Scenario: Scenario 3: Focusing on Family Name Field After Hiding
    Given the family name input field is hidden
    When the user focuses on the family name input field
    Then the family name input field remains hidden

  Scenario Outline: Scenario Outline: First Name Entry and Field Visibility
    Given the first name input field is focused
    When the user enters <first-name> into the first name input field
    Then the family name input field should be <visibility>
    Examples:
      | first-name | visibility |
      | Alice | hidden |
      | Bob | hidden |
      | Charlie | hidden |

