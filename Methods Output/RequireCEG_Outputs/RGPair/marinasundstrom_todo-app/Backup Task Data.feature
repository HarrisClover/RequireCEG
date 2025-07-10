Feature: Backup Task Data

  As a user
  I want to back up my Todo list tasks
  So that I can ensure my task data is safe and recoverable

  Background:
    Given the user has created tasks in the Todo list
    And the user is ready to back up the data

  Scenario: Backup successful with tasks present
    Given the user has created at least one task in the Todo list
    When initiating the backup action
    Then the system attempts to copy tasks to cloud storage
    And a confirmation message is displayed indicating that the task data has been securely backed up

  Scenario: Backup fails due to connectivity issues
    Given the user has created at least one task in the Todo list
    And the backup attempt fails due to connectivity issues
    When initiating the backup action
    Then the system provides an error message to inform the user of the backup failure and recommend that they try again later

  Scenario: No tasks available to back up
    Given there are no tasks present in the Todo list
    When initiating the backup action
    Then the system presents a notification indicating that there is no data available to back up

  Scenario: Backup attempt with no tasks present
    Given there are no tasks present in the Todo list
    When the user attempts to back up the data
    Then the system shows a notification indicating that there is no data available to back up
