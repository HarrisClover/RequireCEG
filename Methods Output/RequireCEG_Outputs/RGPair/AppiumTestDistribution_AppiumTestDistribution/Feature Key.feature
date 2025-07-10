Feature: User Interactions with Buttons and Messages

  As a system user
  I want to receive appropriate messages based on my button interactions
  So that I can understand the system's responses to my actions

  Background:
    Given the user is not logged in
    And the system requires login confirmation for drag-and-drop actions

  Scenario: Scenario 1: Interaction of Button A followed by Button B
    Given the user is logged in
    And the flag is set
    When the user clicks button A then button B
    Then Message D should be displayed after a 1-second delay
    And this occurs only if button B was clicked

  Scenario: Scenario 2: Interaction of Button B followed by Button C
    Given the user is logged in
    When the user clicks button B then button C
    Then Message B should be displayed after a 1-second delay

  Scenario: Scenario 3: Interaction of Button A followed by Button C simultaneously
    Given the user is logged in
    When the user clicks button A and button C at the same time
    Then Message C should be displayed after a 1-second delay

  Scenario: Scenario 4: Invalid interaction of Button A and Button B without clicking Button B
    Given the user is logged in
    When the user clicks button A and button B without clicking button B
    Then no message should be displayed after a 1-second delay

  Scenario: Scenario 5: Attempted drag-and-drop action before login
    Given the user attempts to perform a drag-and-drop action
    And the user is not logged in
    When the user tries to perform a drag-and-drop action
    Then the system mandates successful login confirmation

  Scenario Outline: Scenario Outline: Invalid Drag-and-Drop Actions Before Login
    Given the user attempts drag-and-drop actions
    And the user is not logged in
    When the user tries to perform a drag-and-drop action
    Then the system mandates successful login confirmation
    Examples:
      | User Status | Action | Outcome |
      | Not logged in | Drag-and-drop | Login confirmation required |
      | Not logged in | Click action | No requirement |
      | Logged in | Drag-and-drop | Action successful |

