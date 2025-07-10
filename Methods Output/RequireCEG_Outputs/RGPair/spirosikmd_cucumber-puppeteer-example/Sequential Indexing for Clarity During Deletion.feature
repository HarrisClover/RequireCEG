Feature: Sequential Indexing for Clarity During Deletion

  As a user of the todo list system
  I want to add and remove items from my todo list efficiently
  So that I can manage my tasks without confusion regarding item indexing

  Background:
    Given the system has initialized an empty todo list
    And the total count of items is set to zero

  Scenario: Add an item to the todo list
    Given the user wants to add an item 'Buy Groceries'
    When the user adds 'Buy Groceries' to the list
    Then the item 'Buy Groceries' should be added at index 0
    And the total count of items should be 1
    And a confirmation message is displayed to the user indicating the successful addition of the item and the updated total count

  Scenario: Add multiple items to the todo list
    Given the current todo list has items 'Buy Groceries'
    When the user adds 'Walk the Dog' and 'Read a Book'
    Then the item 'Walk the Dog' should be added at index 1
    And the item 'Read a Book' should be added at index 2
    And the total count of items should be 3
    And a confirmation message is displayed to the user indicating the successful addition of the items and the updated total count

  Scenario: Delete an item from the todo list
    Given the todo list contains items 'Buy Groceries', 'Walk the Dog', and 'Read a Book'
    When the user deletes the item at index 1
    Then the item 'Walk the Dog' should be removed
    And the item 'Read a Book' should now be at index 1
    And the total count of items should be 2
    And the remaining items' indexes are adjusted to maintain sequential order after deletion
    And a feedback message is displayed confirming the successful deletion of the item and reflecting the new count of items

  Scenario: Verify successful deletion and index adjustment
    Given the todo list contains items 'Buy Groceries', 'Read a Book', and 'Exercise'
    When the user deletes the item at index 0
    Then the item 'Buy Groceries' should be removed
    And the item 'Read a Book' should now be at index 0
    And the total count of items should be 2
    And the remaining items' indexes are adjusted to maintain sequential order after deletion
    And a feedback message is displayed confirming the successful deletion of the item and reflecting the new count of items

  Scenario Outline: Add and remove items from the todo list with sequential indexing
    Given the user has a todo list initialized with <initial-items> items
    When the user adds <new-item> to the list
    And the user deletes the item at index <delete-index>
    Then the total count of items should be <final-count>
    Examples:
      | initial-items | new-item | delete-index | final-count |
      | 0 | Buy Groceries | 0 | 0 |
      | 1 | Walk the Dog | 0 | 1 |
      | 2 | Read a Book | 1 | 1 |

