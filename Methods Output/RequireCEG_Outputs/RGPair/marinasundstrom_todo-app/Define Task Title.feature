Feature: Define Task Title

  As a user of the Todo application
  I want to create and manage my tasks efficiently
  So that I can keep track of my responsibilities and avoid duplicating tasks

  Background:
    Given the user is logged into the Todo application
    And the user has access to the task list

  Scenario: Scenario 1: Empty Title Field
    Given the user attempts to create a new task
    When the user submits the task without a title
    Then the system should display a message prompting the user to enter a title

  Scenario: Scenario 2: Valid Title
    Given the user enters a valid title
    When the user submits the task
    Then the system should generate a new Todo item with the defined title
    And the system should store it in the Todo list

  Scenario: Scenario 3: Duplicate Title
    Given the user enters a title that already exists in the Todo list
    When the user submits the task
    Then the system should display a message informing the user that the task title is duplicated

  Scenario: Scenario 4: Title Too Long
    Given the user enters a title that exceeds the allowed character length
    When the user submits the task
    Then the system should prompt the user to shorten the title
    And the system should display a message indicating that the title is too long

  Scenario Outline: Scenario Outline: Title Length Validation
    Given the user enters a title with length <title-length>
    When the user submits the task
    Then the system should <outcome>
    Examples:
      | title-length | outcome |
      | 0 | display a message prompting the user to enter a title |
      | 15 | generate a new Todo item with the defined title |
      | 30 | display a message indicating that the title is too long |
      | 5 | generate a new Todo item with the defined title |


  Scenario: Scenario 5: Title with Invalid Characters
    Given the user enters an invalid title containing prohibited characters
    When the user submits the task
    Then the system should reject the title and display an appropriate error message

  Scenario: Scenario 6: Title Exceeds Character Limit
    Given the user enters a title that exceeds the maximum character limit
    When the user submits the task
    Then the system should prompt the user to shorten the title
    And the system should display a message indicating that the title is too long
