Feature: Manage Todo List

  As a user
  I want to add and remove todos from my list
  So that I can keep track of my tasks effectively

  Background:
    Given the user has an existing todo list

  Scenario: Adding a unique todo item
    Given the todo list contains the items 'Buy groceries', 'Walk the dog'
    When the user adds a new item 'Visit the bank'
    Then the item 'Visit the bank' should be added to the list
    And the total count of items should be increased by one

  Scenario: Attempting to add a duplicate todo item
    Given the todo list contains the items 'Buy groceries', 'Walk the dog'
    When the user adds a new item 'Walk the dog'
    Then an error message 'Item already exists' should be displayed

  Scenario: Deleting an existing todo item
    Given the todo list contains the items 'Buy groceries', 'Visit the bank', 'Walk the dog'
    When the user deletes the item 'Visit the bank'
    Then the item 'Visit the bank' should be removed from the list
    And the total count of items should be decreased by one
    And a confirmation message indicating the item has been successfully removed is presented

  Scenario: Attempting to delete when no items are present
    Given the todo list is empty
    When the user attempts to delete an item
    Then an error message should be displayed indicating there are no items to delete

  Scenario Outline: Scenario Outline: Adding and checking duplicates
    Given the todo list contains <existing-items>
    When the user adds a new item '<new-item>'
    Then the outcome should be '<outcome>'
    Examples:
      | existing-items | new-item | outcome |
      | 'Buy groceries', 'Walk the dog' | 'Visit the bank' | Item added successfully |
      | 'Buy groceries', 'Walk the dog' | 'Walk the dog' | Item already exists |
      | 'Go for a run' | 'Go for a run' | Item already exists |

