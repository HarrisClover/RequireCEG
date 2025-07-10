Feature: Responsive Design for Mobile and Desktop

  As a user
  I want the application to adjust its layout based on my device type
  So that I can have a seamless experience whether I am using a mobile device or a desktop

  Background:
    Given that the application detects the user's device type upon loading
    And the layout adjusts accordingly

  Scenario: Scenario 1: Mobile Device Access
    Given a user accesses the application on a mobile device
    When the user views the todo list
    Then the layout should be responsive and fit the smaller screen size
    And all functionalities remain accessible without horizontal scrolling

  Scenario: Scenario 2: Desktop Device Access
    Given a user accesses the application on a desktop
    When the user views the todo list
    Then the application expands to display additional features
    And the user can view advanced task categorization options

  Scenario: Scenario 3: Task Submission with Valid Description
    Given the user has filled in the task description
    When the task submission button is clicked
    Then the system processes the submission
    And a confirmation message indicates successful task creation

  Scenario: Scenario 4: Task Submission with Empty Description
    Given the user attempts to create a task with an empty description
    When the user clicks the task submission button
    Then the system validates the input
    And an error message prompts the user to enter a valid task description

  Scenario: Scenario 5: Mobile Device Task Submission
    Given the user accesses the application on a mobile device
    When the task submission button is clicked
    Then the system processes the task submission
    And a confirmation message indicates successful task creation

  Scenario: Scenario 6: Desktop Device Task Submission
    Given the user accesses the application on a desktop device
    When the task submission button is clicked
    Then the system processes the task submission
    And a confirmation message indicates successful task creation

  Scenario: Scenario 7: Error for Empty Task Description on Submission
    Given the user selects to create a task with an empty description
    When the user clicks the task submission button
    Then the system triggers an error message
    And the message prompts the user to enter a valid task description
