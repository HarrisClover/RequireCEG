Feature: User Feedback on Item Addition

  As a user of the todo list application
  I want to receive feedback on the addition of todo items
  So that I can understand the status of my todo items and ensure they have been added correctly

  Background:
    Given the todo list application is running
    And the user has access to add items to the list

  Scenario: Scenario 1: Adding the first todo item
    Given the todo list is currently empty
    When the user adds a new item 'Buy groceries'
    Then an error message stating 'Please enter a valid todo item.' is not displayed
    And the message 'You have successfully added your first todo item.' is displayed

  Scenario: Scenario 2: Adding another valid todo item
    Given the todo list already contains 1 item
    When the user adds a new item 'Finish homework'
    Then the message 'You have successfully added a new todo item. Your current total is now 2 items.' is displayed

  Scenario: Scenario 3: Validating invalid format for todo item addition
    Given the todo list contains 2 items 'Wake up', 'Brush teeth'
    When the user attempts to add the item '!!InvalidEntry!!'
    Then an error message stating 'Please enter a valid todo item.' is displayed.

  Scenario: Scenario 4: Adding a valid item after an invalid entry
    Given the todo list contains 2 items 'Wake up', 'Brush teeth'
    When the user attempts to add the item '!!InvalidEntry!!'
    Then an error message stating 'Please enter a valid todo item.' is displayed
    And the user adds a new valid item 'Go for a run'
    Then the message 'You have successfully added a new todo item. Your current total is now 3 items.' is displayed
