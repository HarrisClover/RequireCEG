Feature: Remove Todo Item Functionality

  As a user of the todo list system
  I want to be able to remove an item from my todo list
  So that I can manage my tasks effectively and keep my list organized

  Background:
    Given a user has an existing todo list with items
    And the user is logged into the system

  Scenario: Scenario 1: Successfully removing a valid item
    Given the user requests to remove an item
    And the index of the item is valid (within the current range of the list)
    When the user specifies the index of the item to remove
    Then the item at the specified index should be successfully deleted
    And the total count of items in the list is updated accordingly

  Scenario: Scenario 2: Attempting to remove an item with an invalid index
    Given the user requests to remove an item
    When the user specifies an index that is out of bounds
    Then the system should display an error message 'Error: Item not found at the specified index.'

  Scenario: Scenario 3: Removing the last item from the list
    Given the user has a todo list with only one item
    When the user requests to remove the item at index 0
    Then the item should be successfully deleted
    And the updated list should be empty
    And the total count of items in the list should be 0

  Scenario: Scenario 4: Confirming deletion and renumbering the list
    Given the user has a todo list with multiple items
    When the user removes an item from the list
    Then the updated list should show items renumbered sequentially

  Scenario Outline: Scenario Outline: Removing an item based on user input
    Given a todo list with <item-count> items
    And the user specifies an index <index>
    When the system checks the validity of the index
    Then if <index> is valid, the item should be deleted and the updated list shown
    And if <index> is invalid, an error message should be displayed
    Examples:
      | item-count | index |
      | 5 | 2 |
      | 3 | 1 |
      | 4 | 5 |
      | 10 | -1 |

