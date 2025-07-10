Feature: Display Indexing with Todo Items

  As a user of the todo list system
  I want to add and remove items from my todo list while keeping track of the total count and their respective indices
  So that I can effectively manage my tasks without losing track of them

  Background:
    Given the todo list is initialized as empty
    And the total count of items is zero

  Scenario: Scenario 1: Adding a Todo Item
    Given the total count of items is 0
    When a user adds a new todo item 'Buy groceries'
    Then the total count of items should be 1
    And the todo list should display 'Buy groceries' at index 0

  Scenario: Scenario 2: Adding Multiple Todo Items
    Given the total count of items is 1 with 'Buy groceries' at index 0
    When a user adds a new todo item 'Read a book'
    Then the total count of items should be 2
    And the todo list should display 'Read a book' at index 1

  Scenario: Scenario 3: Removing a Todo Item
    Given the todo list contains items 'Buy groceries' at index 0 and 'Read a book' at index 1
    When the user deletes the todo item at index 0
    Then the total count of items should be 1
    And the todo list should display 'Read a book' at index 0

  Scenario: Scenario 4: Deleting the Last Item
    Given the todo list contains one item 'Read a book' at index 0
    When the user deletes the todo item at index 0
    Then the total count of items should be 0
    And the system should display a message 'The todo list is now empty.'

  Scenario: Scenario 5: Viewing the Todo List Updates After Deletions
    Given the todo list contains items 'Buy groceries' at index 0 and 'Read a book' at index 1
    When the user deletes the todo item at index 0
    Then the system should display 'Read a book' at index 0
    And the total count of items should reflect one less than before

  Scenario Outline: Scenario Outline: Viewing the Todo List
    Given the todo list contains <number> items
    When the user requests to view the todo list
    Then the system should display each item along with its respective index
    Examples:
      | number | item |
      | 1 | Buy groceries |
      | 2 | Read a book |
      | 3 | Walk the dog |

