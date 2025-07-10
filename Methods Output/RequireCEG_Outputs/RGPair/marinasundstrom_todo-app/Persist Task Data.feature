Feature: Persist Task Data

  As a user
  I want to submit tasks with descriptions that are validated and stored
  So that I can keep track of my responsibilities and receive confirmation of my actions

  Background:
    Given the user is logged into the application
    And the user has access to their Todo list

  Scenario: Scenario 1: Valid task submission
    Given the user has a valid task description
    When the user submits the task
    Then the task should be saved to the Todo list
    And a confirmation message should be displayed

  Scenario: Scenario 2: Invalid task submission - empty description
    Given the user has an empty task description
    When the user submits the task
    Then the task should not be saved
    And an error message should prompt the user to provide a valid task description

  Scenario: Scenario 3: Invalid task submission - description exceeds character limit
    Given the user has a task description that exceeds the permitted character limit
    When the user submits the task
    Then the task should not be saved
    And an error message should prompt the user to shorten their task description

  Scenario: Scenario 4: Retrieve Todo list
    Given the user has previously saved tasks
    When the user retrieves their Todo list
    Then all previously stored tasks should be displayed
    And the tasks should be in the order they were created

  Scenario: Scenario 5: Submission when task description is empty
    Given the user has an empty task description
    When the user submits the task
    Then the task should not be saved
    And an error message should prompt the user for a valid task description

  Scenario: Scenario 6: Submission when task description exceeds character limit
    Given the user has a task description that exceeds the permitted character limit
    When the user submits the task
    Then the task should not be saved
    And an error message should prompt the user to shorten their task description

  Scenario: Scenario 7: Retrieve tasks from Todo list
    Given the user has previously saved tasks
    When the user retrieves their Todo list
    Then all previously stored tasks should be displayed
    And the tasks should be in the order they were created
