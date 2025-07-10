Feature: Update Total Count After Deletion

  As a user with a todo list
  I want the system to adjust the total count of items when I delete an item
  So that I can see the updated count of remaining items accurately

  Background:
    Given the user has a todo list containing three items
    And the total count is 3

  Scenario: Scenario 1: Delete an item by index
    Given the user wants to delete the item indexed as '2'
    When the user deletes the item
    Then the remaining items should be re-indexed
    And the total count should be updated to 2

  Scenario: Scenario 2: Delete the last item in the list
    Given the user has only one item left in the todo list
    When the user deletes the last item
    Then the system should confirm that the list is now empty
    And the total count should be reset to zero

  Scenario: Scenario 3: Attempt to delete a non-existent item
    Given the user attempts to delete an item at an index that does not exist
    When the system processes the deletion
    Then the system should respond with an error message indicating that the item could not be found

  Scenario: Scenario 4: Delete an item resulting in re-indexing
    Given the user has a list containing items
    When the user deletes an item
    Then the system should re-index the remaining items
    And the updated total count should reflect the number of remaining items
