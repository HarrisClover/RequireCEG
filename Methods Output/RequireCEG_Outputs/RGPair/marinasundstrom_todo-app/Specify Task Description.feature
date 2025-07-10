Feature: Specify Task Description

  As a user
  I want to create a Todo item with a task description
  So that I can keep track of my tasks efficiently

  Background:
    Given the user is logged into the system
    And the user is on the Todo list page

  Scenario: Scenario 1: Valid Task Description
    Given the task description is not empty
    And the task description does not exceed 255 characters
    And the task description does not already exist in the user's Todo list
    When the user submits the task description
    Then the task should be created and stored in the user's list
    And the user should see a confirmation message

  Scenario: Scenario 2: Empty Task Description
    Given the task description is empty
    When the user submits the task description
    Then the system should display a message prompting the user to enter a valid description

  Scenario: Scenario 3: Task Description is Too Long
    Given the task description exceeds 255 characters
    When the user submits the task description
    Then the system should issue a warning stating that the description is too long and not store the task

  Scenario: Scenario 4: Duplicate Task Description
    Given the task description already exists in the user's list
    When the user tries to create a task with that description
    Then the system should warn the user that this task already exists and prevent it from being stored

  Scenario Outline: Scenario Outline: Validate Task Submission
    Given the task description is <task-description>
    When the user submits the task
    Then the outcome should be <outcome>
    Examples:
      | task-description | outcome |
      | A valid task description | the task should be created and stored |
      |  | the system should prompt for a valid description |
      | A task description that is more than 255 characters long and thus should not be accepted as it exceeds the limit | the system should issue a warning about the length |
      | Duplicate task description | the system should warn about duplication |

