Feature: Update Total Count of Todo Items

  As a user managing a todo list
  I want to add and remove items from my todo list
  So that I can keep track of my tasks and their total count

  Background:
    Given the user has an existing todo list
    And the initial count of todo items is known

  Scenario: Scenario 1: Adding a new todo item
    Given the user is logged in
    And the user has a todo item to add
    When the user adds a new todo item to the existing list
    Then the total count of todo items should increment by one
    And a confirmation message should display indicating the successful addition along with the newly added item and updated total count

  Scenario: Scenario 2: Deleting a todo item
    Given the user is logged in
    And the user has a todo item to delete
    When the user deletes a todo item from the list
    Then the total count of todo items should decrement by one
    And a confirmation message should indicate the deletion, the updated total count, and the remaining items in the list

  Scenario: Scenario 3: Deleting a todo item from the middle of the list
    Given the user has a todo list with five items
    When the user deletes the item at position 2
    Then the total count of todo items should be 4
    And the indices of the subsequent items should be updated

  Scenario: Scenario 4: Ensuring the confirmation messages are displayed correctly
    Given the user has just added a new todo item
    When the system processes the addition
    Then the confirmation message should display a message indicating the successful addition
    And the confirmation message should include the updated total count of todo items

  Scenario: Scenario 5: Middle deletion triggers index update
    Given the user has a todo list with 10 items
    When the user deletes the item at position 5
    Then the total count of todo items should be 9
    And the confirmation message should confirm the update of indices of subsequent items
