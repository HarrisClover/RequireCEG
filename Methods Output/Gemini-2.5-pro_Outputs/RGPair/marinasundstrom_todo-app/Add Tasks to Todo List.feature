Feature: Add Tasks to Todo List
  As an application user
  I want to add new tasks to my Todo list
  So that I can keep track of items I need to complete and stay organized.

  Scenario: Successfully adding a new task
    Given the user is on the Todo list page
    When the user enters "Buy milk" as the description for a new task
    And the user submits the new task
    Then the task "Buy milk" should be added to the Todo list