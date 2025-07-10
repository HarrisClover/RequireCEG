Feature: Set Due Date (Optional)

  As a user managing tasks
  I want to assign an optional due date to my Todo tasks
  So that I can keep track of deadlines and prioritize my work

  Background:
    Given the user is on the Todo task creation screen
    And the due date field is presented as optional

  Scenario: Scenario 1: Create task with future due date
    Given the user enters a task description
    And the user selects a due date that is in the future
    When the user submits the task
    Then the task should be created with the specified due date
    And the task status should not indicate 'Due Today' or 'No Due Date'

  Scenario: Scenario 2: Create task without due date
    Given the user enters a task description
    When the user submits the task without selecting a due date
    Then the task should be created without a due date
    And the task status should be flagged as 'No Due Date'

  Scenario: Scenario 3: Create task with past due date
    Given the user enters a task description
    And the user selects a due date that is in the past
    When the user submits the task
    Then a warning message should be displayed prompting the user to select a future date
    And the task should not be created

  Scenario: Scenario 4: Create task due today
    Given the user enters a task description
    And the user selects today's date as the due date
    When the user submits the task
    Then the task should be created with the specified due date
    And the task status should indicate 'Due Today'

  Scenario: Scenario 5: Create task with invalid combination of dates (future and past dates selected simultaneously) - should fail for past date selection with warning message displayed and task not created.
    Given the user enters a task description
    And the user selects a due date that is in the past
    And the user also selects a due date that is in the future
    When the user submits the task
    Then a warning message should be displayed
    And the task should not be created
