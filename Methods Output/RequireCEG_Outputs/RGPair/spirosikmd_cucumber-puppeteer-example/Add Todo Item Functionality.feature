Feature: Add Todo Item Functionality

  As a user
  I want to add and remove todo items from my list
  So that I can manage my tasks effectively

  Background:
    Given the user has an empty todo list
    And the total count of items is initialized to zero

  Scenario: Scenario 1: Adding a new todo item
    Given the item description is 'Buy Groceries'
    When the user adds the todo item
    Then a confirmation message is displayed stating that the item has been added successfully, along with the updated total count and the index of the newly added item
    And the total count should be 1
    And the item should be at index 0

  Scenario: Scenario 2: Adding multiple todo items
    Given the user has 1 item in the todo list
    When the user adds the todo item 'Walk the Dog'
    Then a confirmation message is displayed stating that the item has been added successfully, along with the updated total count and the index of the newly added item
    And the total count should be 2
    And the new item should be at index 1

  Scenario: Scenario 3: Removing an existing todo item
    Given the user has 2 items in the todo list
    When the user deletes the item at index 0
    Then the item should be removed successfully
    And a feedback message is displayed confirming the successful deletion, along with the current state of the todo list and the remaining number of items and their respective indices
    And the total count should be 1
    And the remaining items should be re-indexed sequentially

  Scenario: Scenario 4: Attempting to delete an item with an invalid index
    Given the user has 2 items in the todo list
    When the user tries to delete the item at index 5
    Then an error message is displayed stating the index is out of bounds
    And the total count should remain 2

  Scenario Outline: Scenario Outline: Adding and Removing Items
    Given the user has <initial-count> items in the todo list
    When the user adds an item '<new-item>'
    And the user removes the item at index <remove-index>
    Then the total count should be <final-count>
    Examples:
      | initial-count | new-item | remove-index | final-count |
      | 0 | Do Laundry | 0 | 0 |
      | 1 | Read Book | 0 | 1 |
      | 2 | Exercise | 1 | 1 |

