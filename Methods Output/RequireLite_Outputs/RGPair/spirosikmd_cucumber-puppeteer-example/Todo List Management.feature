Feature: Todo List Management

  As a user
  I want to manage a todo list by adding and removing items
  So that I can keep track of my tasks efficiently

  Background:
    Given the user has a todo list with 3 items

  Scenario: Scenario 1: Add a new todo item
    Given the current todo list contains 3 items
    When the user adds a new todo item 'Buy groceries'
    Then the item count should be 4
    And the newly added item 'Buy groceries' should be displayed correctly in the list

  Scenario: Scenario 2: Remove an existing todo item
    Given the current todo list contains 4 items
    When the user removes the todo item 'Buy groceries'
    Then the item count should be 3
    And the item 'Buy groceries' should not be displayed in the list

  Scenario Outline: Scenario Outline: Add and Remove items
    Given the todo list contains <initial-count> items
    When the user adds <new-item>
    Then the item count should be <total-count>
    And the user wants to add <new-item>
    Examples:
      | initial-count | new-item | total-count |
      | 3 | Finish homework | 4 |
      | 5 | Walk the dog | 6 |
      | 2 | Call mom | 3 |
      | 4 | Read a book | 5 |

