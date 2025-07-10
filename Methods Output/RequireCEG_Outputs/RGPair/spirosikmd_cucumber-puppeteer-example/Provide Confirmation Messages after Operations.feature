Feature: Provide Confirmation Messages after Operations

  As a user
  I want to receive confirmation messages after adding or removing items from my todo list
  So that I am always updated about the current state of my todo list and its item count

  Background:
    Given the user has a todo list
    And the user is logged into the system

  Scenario: Scenario 1: Addition of an Item
    Given the todo list has 2 items
    When the user adds a new item 'Buy groceries'
    Then the message displayed should be 'Item added successfully. Your todo list now has 3 items.'
    And the updated todo list should be displayed

  Scenario: Scenario 2: Removal of an Existing Item
    Given the todo list has 3 items
    When the user removes the item 'Buy groceries'
    Then the message displayed should be 'Item removed successfully. Your todo list now has 2 items.'

  Scenario: Scenario 3: Attempting to Remove a Non-existent Item
    Given the todo list has 2 items
    When the user tries to remove an item 'Go jogging'
    Then the message displayed should be 'Item not found. Please check your todo list and try again.'

  Scenario: Scenario 4: Confirmation Message after Addition and Deletion
    Given the todo list has 2 items
    When the user adds a new item 'Finish report'
    Then the message displayed should be 'Item added successfully. Your todo list now has 3 items.'
    And the user tries to remove the item 'Finish report'
    Then the message displayed should be 'Item removed successfully. Your todo list now has 2 items.'

  Scenario Outline: Scenario Outline: Addition and Deletion of Items
    Given the todo list has <initial-count> items
    When the user adds '<new-item>'
    Then the message displayed should be 'Item added successfully. Your todo list now has <updated-count> items.'
    And the user tries to remove '<item-to-remove>'
    Then the message displayed should be '<removal-message>'
    Examples:
      | initial-count | new-item | updated-count | item-to-remove | removal-message |
      | 2 | Finish report | 3 | Finish report | Item removed successfully. Your todo list now has 2 items. |
      | 3 | Call the bank | 4 | Call the bank | Item removed successfully. Your todo list now has 3 items. |
      | 1 | Prepare presentation | 2 | Non-existent item | Item not found. Please check your todo list and try again. |

