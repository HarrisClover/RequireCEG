Feature: Tag Task with Categories (Optional)

  As a user
  I want to create tasks categorized under predefined sections
  So that I can easily organize and filter my tasks

  Background:
    Given the user is logged into the system
    And a predefined list of categories is available

  Scenario: Create a task with a category
    Given the user selects a category from the predefined list
    When the user creates a new task
    Then the task should be associated with the selected category
    And the task should be stored in the database
    And the task should be displayed under the specified category in the Todo list view

  Scenario: Create a task without a category
    Given the user leaves the category selection blank
    When the user creates a new task
    Then the task should be stored without a category tag
    And the task should default to the general Todo list section
    And the system should store the task without a category tag in the database

  Scenario: Filter tasks by category
    Given the user has multiple tasks with different categories
    When the user applies a filter to view tasks by a specific category
    Then only the tasks associated with that category should be displayed
    And the system should allow users to filter and view only tasks associated with the selected category

  Scenario: Change the category of a task
    Given the user has a task tagged with a specific category
    When the user updates the category of the task
    Then the task should reflect the updated category in the Todo list
    And the task should be displayed under the new category
    And the system should update the category of the previously tagged task

  Scenario Outline: Scenario Outline: Create task with varying categories
    Given the user selects a category '<category>'
    And the user creates a task with title '<task-title>'
    When the user submits the task creation form
    Then the task with title '<task-title>' should be associated with the category '<category>'
    Examples:
      | category | task-title |
      | Work | Design a new logo |
      | Personal | Buy groceries |
      | Shopping | Order new shoes |


  Scenario: Validate selected category
    Given the user selects a category from the predefined list
    When the system checks if the selected category is valid
    Then the category should be marked as valid
    And the system should allow task creation with the selected category

  Scenario: Avoid blank category creation
    Given the user leaves the category selection blank
    When the user creates a new task
    Then the system should not allow saving of the task without validating the category
    And the task should default to the general Todo list section
