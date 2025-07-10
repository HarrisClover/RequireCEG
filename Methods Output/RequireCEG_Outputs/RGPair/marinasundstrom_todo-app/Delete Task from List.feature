Feature: Delete Task from List

  As a user
  I want to delete tasks from my Todo list
  So that I can keep my list organized and remove completed or unnecessary tasks

  Background:
    Given the Todo list contains tasks
    And the user is logged into the system

  Scenario: Scenario 1: Task exists and is deleted
    Given the user selects a task that exists in the Todo list
    When the system prompts the user to confirm deletion
    Then the user selects 'Yes'
    And the system removes the task from the Todo list
    And the system displays a success message confirming deletion

  Scenario: Scenario 2: Task exists but user cancels deletion
    Given the user selects a task that exists in the Todo list
    When the system prompts the user to confirm deletion
    Then the user selects 'No'
    And the system maintains the current state of the Todo list
    And the system displays a message indicating no changes have been made

  Scenario: Scenario 3: Task not found in the Todo list
    Given the user selects a task that does not exist in the Todo list
    When the system checks the Todo list
    Then the system displays an error message stating the task could not be found

  Scenario: Scenario 4: User tries to delete an existing task without confirming
    Given the user selects a task that exists in the Todo list
    When the system prompts the user to confirm deletion
    Then the user does not select 'Yes' or 'No'
    And the system does not remove the task from the Todo list
    And the system keeps the Todo list unchanged
