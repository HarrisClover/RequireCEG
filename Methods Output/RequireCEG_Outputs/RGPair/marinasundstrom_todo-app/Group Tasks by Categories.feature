Feature: Group Tasks by Categories

  As a user
  I want to create and manage Todo tasks categorized by predefined lists
  So that I can easily organize and view my tasks

  Background:
    Given the user has a predefined list of categories
    And the user is logged in

  Scenario: Scenario 1: Create a new Todo task
    Given the user has selected a category from the predefined list
    When the user creates a new Todo task
    Then the task should be associated with the selected category
    And the task should be stored in the database
    And the system should display the created task in the Todo list grouped by the assigned category

  Scenario: Scenario 2: Fail to create a new Todo task without category
    Given the user has not selected a category from the predefined list
    When the user attempts to create a new Todo task
    Then the system should display an error message prompting the user to select a category before submission

  Scenario: Scenario 3: View Todo list grouped by categories
    Given the user has created multiple tasks in different categories
    When the user views their Todo list
    Then the tasks should be displayed grouped by their respective categories
    And each category heading should be clearly labeled

  Scenario: Scenario 4: View empty category message
    Given the user is viewing a category that has no tasks
    When the user selects that category
    Then the system should present a message indicating 'No tasks available in this category.'

  Scenario: Scenario 5: Change the category of an existing task
    Given the user has an existing task
    When the user selects a new category from the predefined list
    Then the category of the task should be updated in the database
    And the system should reflect the change in the displayed Todo list after the category change

  Scenario: Scenario 6: Remove a task
    Given the user has an existing task in their Todo list
    When the user removes the task
    Then the task should be deleted from the associated category in the database
    And the Todo list should immediately refresh to show the updated tasks

  Scenario: Scenario 7: Update task category correctly
    Given the user has changed the category of an existing task
    When the task's category is updated
    Then the system should update the task's category in the database
    And the system should refresh the Todo list to show the updated tasks

  Scenario: Scenario 8: Condition check for empty category
    Given the user has selected a category that contains no tasks
    When the user views their Todo list
    Then the system should display the message 'No tasks available in this category.'
