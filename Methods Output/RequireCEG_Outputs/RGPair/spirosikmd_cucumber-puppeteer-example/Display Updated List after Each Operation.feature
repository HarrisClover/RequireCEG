Feature: Display Updated List after Each Operation

  As a user
  I want to manage my todo list efficiently, adding and removing items
  So that I can keep track of my tasks and their statuses

  Background:
    Given the todo list is initialized
    And the total item count is set to zero

  Scenario: Scenario 1: Adding the first item to an empty list
    Given the todo list is empty
    When a user adds a new item 'Buy groceries'
    Then the updated todo list should display 'Buy groceries'
    And the message 'Item added successfully' should be shown
    And the total count should be 1

  Scenario: Scenario 2: Adding multiple items to the list
    Given the todo list contains 'Buy groceries'
    When a user adds a new item 'Clean the house'
    Then the updated todo list should display 'Buy groceries', 'Clean the house'
    And the message 'Item added successfully' should be shown
    And the total count should be 2

  Scenario: Scenario 3: Deleting an existing item from the list
    Given the todo list contains 'Buy groceries', 'Clean the house'
    When a user deletes the item 'Clean the house'
    Then the updated todo list should display 'Buy groceries'
    And the message 'Item deleted successfully' should be shown
    And the total count should be 1

  Scenario: Scenario 4: Deleting the last item in the list
    Given the todo list contains 'Buy groceries'
    When a user deletes the item 'Buy groceries'
    Then the message 'Todo list is empty.' should be shown

  Scenario: Scenario 5: Adding an item while another is being added
    Given the todo list is empty
    And a new item is being added
    When a user adds a new item 'Read a book'
    Then the updated todo list should display 'Read a book'
    And the message 'Item added successfully' should be shown
    And the total count should be 1

  Scenario: Scenario 6: Attempt to delete an item that does not exist
    Given the todo list contains 'Buy groceries'
    When a user deletes the item 'Walk the dog'
    Then the updated todo list should display 'Buy groceries'
    And the message 'Item not found' should be shown

  Scenario Outline: Scenario Outline: Adding and deleting items from the list
    Given the todo list contains <initial-item>
    When a user adds the item <new-item>
    Then the updated todo list should display <expected-list>
    And the message 'Item added successfully' should be shown
    And the total count should be <expected-count>
    Examples:
      | initial-item | new-item | expected-list | expected-count |
      |  | Buy groceries | Buy groceries | 1 |
      | Buy groceries | Clean the house | Buy groceries, Clean the house | 2 |

