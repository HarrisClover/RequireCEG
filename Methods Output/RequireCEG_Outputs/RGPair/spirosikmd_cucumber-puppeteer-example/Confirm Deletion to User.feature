Feature: Confirm Deletion to User

  As a user of the to-do list application
  I want to confirm deletion of items
  So that I can ensure that I do not accidentally delete important items

  Background:
    Given the user has a list of items in their to-do list
    And the user selects an item for deletion

  Scenario: Scenario 1: User confirms deletion
    Given the system displays a confirmation dialog
    And the user sees the message asking for confirmation
    When the user selects 'Yes'
    Then the item is removed from the list
    And the total count of remaining items is updated

  Scenario: Scenario 2: User cancels deletion
    Given the system displays a confirmation dialog
    When the user selects 'No'
    Then the item remains in the list
    And the system shows no feedback message after cancellation

  Scenario: Scenario 3: List becomes empty after deletion
    Given the user has only one item in the to-do list
    When the user confirms deletion of that item
    Then the list is now empty
    And the system notifies the user that the list is empty

  Scenario: Scenario 4: User confirms deletion with remaining items
    Given the user has multiple items in the to-do list
    When the user selects an item and confirms deletion
    Then the selected item is removed from the list
    And the total count of remaining items updates correctly
