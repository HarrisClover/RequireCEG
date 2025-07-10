Feature: Managing Todo List
  As a user,
  I want to create and manage tasks in my Todo list
  So that I can effectively track and complete my responsibilities

Scenario: Adding a new task to the Todo list
  Given the user is logged into the system
  When the user creates a new task with the description "Buy groceries"
  Then the task "Buy groceries" should appear in the Todo list

Scenario: Submitting a new task and confirming it's added
  Given the user is logged into the system
  When the user submits the task "Finish homework"
  Then the task "Finish homework" should be stored in the Todo list

Scenario: Viewing all tasks in the Todo list
  Given the user is logged into the system
  When the user views the Todo list
  Then the Todo list should display all the tasks the user has created

Scenario: Completing a task in the Todo list
  Given the task "Buy groceries" is in the Todo list
  When the user marks the task "Buy groceries" as completed
  Then the task "Buy groceries" should be marked as completed in the Todo list
