Feature: Mark Task as Completed

  As a user
  I want to mark my tasks as completed
  So that I can keep track of what I have accomplished

  Background:
    Given a task exists in the user's Todo list
    And the current status of the task is known

  Scenario: Scenario 1: Marking an incomplete task as completed
    Given the task status is not 'Completed'
    When the user marks the task as completed
    Then the task status should be updated to 'Completed'
    And the task should display a strikethrough text effect

  Scenario: Scenario 2: Attempting to mark an already completed task
    Given the task status is 'Completed'
    When the user marks the task as completed again
    Then the task status remains 'Completed'
    And the application should provide a message indicating that the task is already completed

  Scenario: Scenario 3: Marking an incomplete task as completed with additional check
    Given the task status is not 'Completed'
    And the current task status is known
    When the user marks the task as completed
    Then the task status should be updated to 'Completed'
    And the task should display a strikethrough text effect

  Scenario: Scenario 4: Not modifying completed task state
    Given the task status is 'Completed'
    When the user tries to modify the task state
    Then the task state remains unchanged
    And the application should show a message that no changes can be made
