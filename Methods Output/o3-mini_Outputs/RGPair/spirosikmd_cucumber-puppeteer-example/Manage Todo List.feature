Feature: Manage Todo List
  As a user,
  I want to be able to add and remove todo items,
  So that I can maintain an up-to-date list of tasks with clear feedback.

  Scenario: Adding a new todo item
    Given the todo list is initialized with existing items
    When the user adds a new todo item "Buy groceries"
    Then the system should increase the total count of items by 1
    And the new todo item "Buy groceries" should be displayed at the end of the list
    And the system should provide feedback confirming that the item was added successfully

  Scenario: Removing an existing todo item
    Given the todo list contains the following items:
      | Index | Todo item        |
      | 1     | Buy groceries    |
      | 2     | Read a book      |
      | 3     | Call the bank    |
    When the user deletes the todo item at index 2
    Then the system should decrease the total count of items by 1
    And the remaining todo items should be re-indexed sequentially
    And the system should provide feedback confirming that the item was removed successfully
