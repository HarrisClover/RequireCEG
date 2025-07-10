Feature: Manage Todo List
  As a user,
  I want to be able to add and delete todo items
  So that I can manage my todo list effectively

Scenario Outline: Add and Remove Todo Items
  Given that the user has a todo list with <initial-item-count> items
  When the user adds a new todo item "<item>"
  Then the total number of items in the todo list should be <new-item-count>
  And the todo list should include "<item>"
  
  When the user removes the todo item at index <item-index>
  Then the total number of items in the todo list should be <reduced-item-count>
  And the todo list should no longer include the removed item
  
Examples:
  | initial-item-count | item              | new-item-count | item-index | reduced-item-count |
  | 3                  | "Buy groceries"    | 4              | 2          | 3                  |
  | 5                  | "Complete project" | 6              | 4          | 5                  |
