Feature: Todo List Management
  As a user
  I want to manage my todo list by adding and deleting items
  So that I can keep track of my tasks effectively

  Scenario: Add a new item to an existing todo list
    Given I have a todo list with the following items:
      | Index | Task          |
      | 1     | Buy groceries |
      | 2     | Pay bills     |
    When I add a new todo item named "Walk the dog"
    Then the total number of items in the list should be 3
    And the list should contain the following items in order:
      | Index | Task          |
      | 1     | Buy groceries |
      | 2     | Pay bills     |
      | 3     | Walk the dog  |
    And I should receive a confirmation message "Item added successfully"

  Scenario: Delete an existing item from the todo list
    Given I have a todo list with the following items:
      | Index | Task             |
      | 1     | Clean the house  |
      | 2     | Call mom         |
      | 3     | Schedule meeting |
    When I delete the todo item at index 2
    Then the total number of items in the list should be 2
    And the list should contain the following items in order:
      | Index | Task             |
      | 1     | Clean the house  |
      | 2     | Schedule meeting |
    And I should receive a confirmation message "Item deleted successfully"