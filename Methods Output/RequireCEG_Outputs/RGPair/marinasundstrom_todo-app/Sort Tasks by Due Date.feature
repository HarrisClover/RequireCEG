Feature: Sort Tasks by Due Date

  As a user
  I want to sort my tasks by their due dates
  So that I can easily view my upcoming tasks in the order they are due

  Background:
    Given the user has a list of tasks
    And some tasks have due dates

  Scenario: Scenario 1: No Tasks Present
    Given the task list is empty
    When the user selects the option to sort tasks by due date
    Then the system should display 'There are no tasks to sort.'

  Scenario: Scenario 2: Tasks with Due Dates
    Given the task list has tasks with due dates
    When the user selects the option to sort tasks by due date
    Then the system should display the tasks sorted by ascending due dates
    And the system should display the sorted list of tasks to the user.

  Scenario: Scenario 3: Tasks with Same Due Dates
    Given the task list has multiple tasks with the same due date
    When the user selects the option to sort tasks by due date
    Then the system should sort those tasks alphabetically by their titles
    And the system should display the sorted list of tasks to the user.

  Scenario: Scenario 4: Tasks without Due Dates Present with Sorting Request
    Given the task list contains tasks without due dates
    When the user selects the option to sort tasks by due date
    Then the system should display 'There are no tasks to sort.'

  Scenario Outline: Scenario Outline: Tasks Sorting Validation
    Given the task list contains <number> tasks with due dates
    And the sorted tasks should be <sorted-tasks>
    When the user selects the option to sort tasks by due date
    Then the system should display <expected-output>
    Examples:
      | number | sorted-tasks | expected-output |
      | 0 | N/A | There are no tasks to sort. |
      | 2 | Task A - 2023-10-01, Task B - 2023-10-02 | Task A - 2023-10-01, Task B - 2023-10-02 |
      | 3 | Task C - 2023-10-01, Task A - 2023-10-01, Task B - 2023-10-02 | Task A - 2023-10-01, Task C - 2023-10-01, Task B - 2023-10-02 |

