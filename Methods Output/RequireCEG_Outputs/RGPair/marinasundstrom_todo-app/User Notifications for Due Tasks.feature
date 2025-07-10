Feature: User Notifications for Due Tasks

  As a user of the task management system
  I want to receive timely notifications about due tasks
  So that I can manage my tasks effectively and meet my deadlines

  Background:
    Given the user has a task list with due dates
    And the current date is tracked by the system

  Scenario: Notification for tasks due today
    Given the user has tasks with the due date set to today
    When the current date matches the due date
    Then the system triggers a notification stating 'Reminder: Your task is due today.'

  Scenario: Notification for upcoming due tasks
    Given the user has tasks due within the next three days
    When the date is checked
    Then the user receives a notification indicating 'Upcoming due tasks: [list of tasks].'

  Scenario: Suppressing snoozed task reminders
    Given the user has previously snoozed a notification for a task
    When the due date arrives
    Then the system suppresses reminders for that task until the snooze period expires

  Scenario: No further notifications for completed tasks
    Given the user marks a due task as completed before its due date
    When the due date arrives
    Then the system does not generate any further notifications for that task

  Scenario: Consolidated notifications for multiple tasks
    Given the user has multiple tasks due today
    When the current date matches the due dates of those tasks
    Then the user receives a consolidated summary notification stating 'You have the following tasks due today: [list of tasks].'

  Scenario: Required dependency for tasks completion
    Given the user has marked a task as completed before its due date
    And the due date for that task has arrived
    When the system checks the status of the task
    Then the system confirms that the task has been completed.
