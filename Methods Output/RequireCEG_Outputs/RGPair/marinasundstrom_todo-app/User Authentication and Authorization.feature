Feature: User Authentication and Authorization

  As a user
  I want to log in and manage my Todo tasks
  So that I can keep track of my tasks securely

  Background:
    Given the user is on the login page
    And the user has registered credentials

  Scenario: Scenario 1: Successful login
    Given the user enters valid username and password
    When the user submits the login form
    Then the user should see a success message
    And the user should be redirected to the Todo list

  Scenario: Scenario 2: Unsuccessful login
    Given the user enters invalid username or password
    When the user submits the login form
    Then the user should see an error message 'Unsuccessful login'
    And the user remains on the login page

  Scenario: Scenario 3: Create task without login
    Given the user is not logged in
    When the user attempts to create a new task
    Then the user should be redirected to the login page
    And the user should see an error message for task creation attempt when not logged in.

  Scenario: Scenario 4: Create task after login
    Given the user logs in successfully
    When the user creates a new task with valid details
    Then the task should be added to the Todo list
    And the user should see a confirmation message 'Task added successfully'.
