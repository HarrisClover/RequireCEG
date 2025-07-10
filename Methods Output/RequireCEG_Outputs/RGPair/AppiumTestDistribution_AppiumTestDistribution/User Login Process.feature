Feature: User Login Process

  As a user
  I want to log in successfully with valid credentials and interact with the system
  So that I can perform actions such as drag-and-drop without issues

  Background:
    Given the user is not logged in
    And the current flag is not set

  Scenario: Successful login with valid credentials
    Given the user provides valid credentials
    When the user logs into the system
    Then the user should be logged in successfully
    And the user is logged in.

  Scenario: Drag-and-drop action by a logged-in user
    Given the user is logged in
    When the user performs a drag-and-drop action
    Then the drag-and-drop should be registered without interference

  Scenario: Attempting drag-and-drop action by a non-logged-in user
    Given the user is not logged in
    When the user attempts a drag-and-drop action
    Then the action should be blocked, requiring login

  Scenario: Interaction without flag set
    Given the user is logged in
    And the current flag is not set
    When the user clicks on 1 and 3
    Then no message should be displayed

  Scenario: Interaction with flag set
    Given the user is logged in
    And the current flag is set
    When the user clicks on 1 and 2
    Then message D should be displayed

  Scenario: Condition for logged-in status
    Given the user has provided valid credentials for login
    When the condition of the user being logged in holds
    Then the system should reflect the user's logged-in status
    And display message A accordingly.

  Scenario: Checking drag-and-drop with delay
    Given the user is logged in
    And the system has a one-second delay between actions
    When the user performs a drag-and-drop action
    Then the action should be processed without delay-related interference.

  Scenario: Condition on clicking numbers
    Given the user is logged in
    And the user clicks on numbers 4 and 3
    When the user performs an interaction
    Then display message A.
    And confirm the drag-and-drop functionality is acting as per expectations.

  Scenario Outline: Scenario Outline: Interaction outcomes based on clicked numbers
    Given the user is logged in
    And specific combinations of numbers are clicked: <number1> and <number2>
    When the user interacts with the system
    Then the correct message <message> should be displayed
    Examples:
      | number1 | number2 | message |
      | 4 | 3 | message A |
      | 1 | 2 | message B |
      | 2 | 3 | message C |

