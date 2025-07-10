Feature: Filter Tasks by Status (Completed/Pending)

  As a user
  I want to filter tasks based on their status selection: 'Completed', 'Pending', or 'All'
  So that I can easily manage my tasks and focus on what needs to be done

  Background:
    Given a user is logged into the application
    And the task database is populated with tasks

  Scenario: Scenario 1: View Completed Tasks
    Given a user selects 'Completed' from the task status filter
    When the system queries the database for completed tasks
    Then the system displays the list of completed tasks
    And if no tasks are completed, the message 'There are no completed tasks.' is shown

  Scenario: Scenario 2: View Pending Tasks
    Given a user selects 'Pending' from the task status filter
    When the system queries the database for pending tasks
    Then the system displays the list of pending tasks
    And if no tasks are pending, the message 'There are no pending tasks.' is shown

  Scenario: Scenario 3: View All Tasks
    Given a user selects 'All' from the task status filter
    When the system retrieves all tasks from the database
    Then the system displays a combined list of both completed and pending tasks

  Scenario: Scenario 4: Ensure Restrictions on Task Status
    Given the user selects 'Completed' and 'Pending' simultaneously
    Then the system displays a warning message indicating that both conditions cannot be selected at the same time

  Scenario: Scenario 5: Verify Exclusive Condition
    Given the task list contains both completed and pending tasks
    When the user selects 'Completed' and 'All' from the task status filter
    Then the system must show the display of all tasks, not allowing only completed tasks to be shown
