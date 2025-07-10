Feature: Alert for Successful or Failed Operations

  As a user
  I want to manage my todo list by adding and removing items
  So that I can keep track of my tasks effectively

  Background:
    Given the todo list is initialized
    And the user is logged into the system

  Scenario: Scenario 1: Adding a new item to the list
    Given the todo list is empty
    When the user adds a todo item with description 'Buy groceries'
    Then the system should display 'Todo item added as the first item.'
    And the total count of items should be 1

  Scenario: Scenario 2: Adding an existing item to the list
    Given the todo list contains 'Buy groceries'
    When the user attempts to add the item 'Buy groceries' again
    Then the system should display 'Failed to add item: Item already exists.'

  Scenario: Scenario 3: Removing an existing item from the list
    Given the todo list contains 'Buy groceries'
    When the user removes the item 'Buy groceries'
    Then the system should display 'Todo item successfully removed.'
    And the total count of items should be 0

  Scenario: Scenario 4: Removing a non-existent item from the list
    Given the todo list is empty
    When the user tries to remove the item 'Buy groceries'
    Then the system should display 'Failed to remove item: Item not found.'

  Scenario: Scenario 5: Attempting to add an item when it already exists and checking for duplicate prevention logic and total item count update response during an addition operation when the list is not empty and an item already exists in the list, as well as handling assertion response about total item count update upon removing an existing item upon a remove action within success context detected on the existing item in the list outline logic.
    Given the todo list contains 'Doctor appointment'
    When the user attempts to add 'Doctor appointment' again
    Then the system should display 'Failed to add item: Item already exists.'

  Scenario: Scenario 6: Checking empty list behavior when adding new items directly after they were removed.
    Given the todo list is empty
    When the user tries to remove any item from the list
    Then the system should display 'Failed to remove item: Item not found.'

  Scenario Outline: Scenario Outline: Adding items to the list
    Given the todo list has <existing-item>
    And the user attempts to add <new-item>
    When the operation is performed
    Then the system should display <expected-result>
    Examples:
      | existing-item | new-item | expected-result |
      | none | Doctor appointment | Todo item added as the first item. |
      | Grocery shopping | Grocery shopping | Failed to add item: Item already exists. |
      | Read a book | Read a book | Failed to add item: Item already exists. |

