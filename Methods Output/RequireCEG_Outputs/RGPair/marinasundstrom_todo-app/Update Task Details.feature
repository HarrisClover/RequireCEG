Feature: Update Task Details

  As a user of the Todo list
  I want to modify task details including the description and due date
  So that I can keep my task list organized and ensure tasks are up-to-date

  Background:
    Given the user is logged into the Todo list system
    And there are existing tasks in the Todo list

  Scenario: Successfully update a task description
    Given a task is selected for editing
    When the user modifies the task description and clicks the save button
    Then the task is updated in the Todo list reflecting the new details

  Scenario: Provide an error when the description is blank
    Given a task is selected for editing
    When the user leaves the task description blank and clicks the save button
    Then an error message 'Please provide a valid task description.' will be displayed

  Scenario: Update a task due date successfully
    Given a task is selected for editing with a due date
    When the user changes the due date and clicks the save button
    Then the updated due date will be saved and shown in the Todo list

  Scenario: Mark a task as completed
    Given a task is selected from the Todo list
    When the user marks the task as completed
    Then the task's appearance changes to indicate its completion status

  Scenario: Attempt to update a non-existent task
    Given the user attempts to edit a task that does not exist in the Todo list
    Then an error message 'Task cannot be found.' will be presented

  Scenario: Provide an error when the new task description is invalid
    Given a task is selected for editing
    When the user modifies the task description to an invalid format and clicks the save button
    Then the task is not updated in the Todo list and shows an error message
