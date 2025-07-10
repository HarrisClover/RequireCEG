Feature: Manage To-Do List
  As a user,
  I want to be able to add and remove items in my to-do list
  So that I can keep track of my tasks and adjust my list as needed.

  Scenario: Adding a new to-do item
    Given the user has a to-do list with the following items:
      | Item            |
      | ---------------- |
      | Buy groceries   |
      | Call John       |
    When the user adds a new item "Finish homework" to the to-do list
    Then the to-do list should display 3 items:
      | Item            |
      | ---------------- |
      | Buy groceries   |
      | Call John       |
      | Finish homework |
    And the total count of items should be 3

  Scenario: Removing an existing to-do item
    Given the user has a to-do list with the following items:
      | Item            |
      | ---------------- |
      | Buy groceries   |
      | Call John       |
      | Finish homework |
    When the user removes the item "Call John" from the to-do list
    Then the to-do list should display 2 items:
      | Item            |
      | ---------------- |
      | Buy groceries   |
      | Finish homework |
    And the total count of items should be 2
