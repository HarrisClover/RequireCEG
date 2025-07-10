Feature: Todo List Management
  As a user,
  I want to maintain a list of tasks (Todos)
  So that I can keep track of items I need to complete.

  Scenario: Creating a new task
    Given the user is on the Todo list page
    When the user enters a task description "Buy groceries" into the new task field
    And the user submits the task
    Then the task "Buy groceries" should be added to the Todo list

  Scenario Outline: Adding multiple tasks
    Given the user is on the Todo list page
    When the user enters the task "<task>" into the new task field
    And the user submits the task
    Then the task "<task>" should be added to the Todo list

    Examples:
      | task               |
      | Complete report    |
      | Call customer      |
      | Buy office supplies|
