Feature: User Interaction and Drag-and-Drop Functionality

  As a store owner
  I want to ensure the application supports user interactions through simulated button clicks and drag-and-drop actions
  So that I can verify user engagement and system responsiveness during simultaneous operations

  Background:
    Given the system requires user login before performing any actions
    And the scenario introduces a delay of one second for each action

  Scenario: Scenario 1: User clicks buttons
    Given a user is logged into the system
    When the user clicks on button 4
    Then the action is acknowledged by the system with a confirmation message displayed
    And the system prepares for the next action after a one second delay

  Scenario: Scenario 2: User performs drag-and-drop
    Given the system is ready after user login
    When the user drags an item from category A to the basket
    Then the item visually appears in the basket
    And the basket total is updated accordingly with a confirmation notification

  Scenario Outline: Scenario Outline: User clicks multiple buttons
    Given the user is logged in
    When the user clicks buttons <button1> and <button2>
    Then the actions for buttons <button1> and <button2> are processed without race conditions
    And the user receives a prompt confirming the actions performed
    Examples:
      | button1 | button2 |
      | 1 | 2 |
      | 3 | 4 |
      | 4 | 3 |

