Feature: Retrieve Task List

  As a user
  I want to retrieve my Todo list
  So that I can manage my tasks effectively

  Background:
    Given the user is logged into the system
    And the user has tasks associated with their ID

  Scenario: Scenario 1: No tasks found
    Given the user has no tasks in their Todo list
    When the user requests their Todo list
    Then the system should display a message indicating 'Your Todo list is empty.'

  Scenario: Scenario 2: Tasks available
    Given the user has tasks in their Todo list
    When the user requests their Todo list
    Then the system should compile a list of these tasks
    And the system should display each task's description and its completion status

  Scenario: Scenario 3: Filter by completion status
    Given the user has both completed and pending tasks
    When the user specifies a filter to show only completed tasks
    Then the system should apply the filter before presenting the results
    And the output should show only the completed tasks

  Scenario: Scenario 4: User has no tasks
    Given the user has provided no filters for task retrieval
    When the user requests their Todo list
    Then the system should display 'Your Todo list is empty.'
    And the condition of tasks not found should be affirmed by the system querying the database

  Scenario Outline: Scenario Outline: Filter by task completion
    Given the user has <task-count> tasks with <status>
    When the user requests their Todo list with a filter for <status>
    Then the system should return <expected-output>
    Examples:
      | task-count | status | expected-output |
      | 0 | completed | No tasks available |
      | 5 | pending | List of 5 pending tasks |
      | 3 | completed | List of 3 completed tasks |

