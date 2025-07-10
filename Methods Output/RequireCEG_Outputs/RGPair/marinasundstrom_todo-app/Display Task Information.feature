Feature: Display Task Information

  As a user
  I want to create and manage Todo tasks
  So that I can track my tasks efficiently

  Background:
    Given the user is logged into the system
    And the user has existing tasks in the system

  Scenario: Scenario 1: Create a new task
    Given the user enters a task title and sets the status to 'Incomplete'
    When the user creates the task
    Then the system stores the task title and its status as 'Incomplete'

  Scenario: Scenario 2: Mark a task as complete
    Given the user has a task titled 'Buy groceries'
    When the user marks the task as 'Complete'
    Then the system displays 'Task completed successfully.'

  Scenario: Scenario 3: Highlight an overdue task
    Given the user has a task with a due date of yesterday
    When the user views the tasks
    Then the task should be highlighted in red
    And the system alerts 'This task is overdue.'

  Scenario: Scenario 4: Notification for today's due task
    Given the user has a task with a due date of today
    When the user views the tasks
    Then the system presents a notification stating 'This task is due today.'

  Scenario: Scenario 5: View tasks based on status
    Given the user has multiple tasks
    When the user requests to view tasks with the status 'Incomplete'
    Then the system incorporates a filtering feature to view tasks based on status (e.g., all tasks, completed tasks, overdue tasks).
