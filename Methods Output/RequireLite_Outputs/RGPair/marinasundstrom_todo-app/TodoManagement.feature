Feature: TodoManagement

  As a user
  I want to maintain a list of tasks, known as 'Todos'
  So that I can effectively track items I need to complete

  Background:
    Given the user is logged into the application
    And the user has access to the Todo list

  Scenario: Create a new task
    Given the user wants to add a new task
    When the user submits a task description
    Then the task should be added to the Todo list
    And the Todo list should reflect the new task

  Scenario: View the Todo list with existing tasks
    Given the user has already added tasks to the Todo list
    When the user views the Todo list
    Then the user should see all the tasks listed

  Scenario Outline: Adding multiple tasks
    Given the user wants to add <number> tasks
    When the user submits the tasks
    Then <number> tasks should be added to the Todo list
    And the task descriptions are <tasks>
    Examples:
      | number | tasks |
      | 2 | Buy groceries, Clean the house |
      | 3 | Read a book, Write a report, Call a friend |
      | 1 | Finish the project |


  Scenario: Handle invalid input when adding a task
    Given the user wants to add a task
    When the user submits an empty task description
    Then an error message should be displayed
    And the Todo list should not include empty tasks
