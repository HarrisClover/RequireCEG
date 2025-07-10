Feature: Maintain Integrity of Remaining Items

  As a user
  I want to add and remove items from a todo list
  So that I can manage my tasks efficiently

  Background:
    Given the todo list has a maximum limit of items
    And the current count of items is within the limit

  Scenario: Scenario 1: Attempt to delete from an empty list
    Given the todo list is empty
    When attempting to delete an item
    Then the system will display a message indicating that the todo list is already empty
    And no items can be removed

  Scenario: Scenario 2: Successfully remove an item from the list
    Given the todo list contains items
    When removing an item at a valid index
    Then the item should be successfully removed
    And the remaining items should be re-indexed

  Scenario: Scenario 3: Attempt to remove an item with an invalid index
    Given the todo list contains items
    When trying to remove an item at an invalid index
    Then the system will display a message indicating the index is invalid

  Scenario: Scenario 4: Attempt to add an item when list is full
    Given the todo list is at its maximum capacity
    When attempting to add a new item
    Then the system will reject the addition
    And display an error message indicating that the maximum capacity has been reached

  Scenario: Scenario 5: Successfully add an item to the list
    Given the todo list is not full
    When adding a new todo item
    Then the item should be appended to the list
    And a confirmation message should be displayed

  Scenario: Scenario 6: Integrity check when removing an item with a valid index
    Given the todo list contains items and not at maximum capacity
    When removing an item at a valid index
    Then the item is removed and remaining items are re-indexed
    And the total count of items updates correctly
