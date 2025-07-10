Feature: User Registration, Authentication, and Authorization
  As a prospective user
  I want to register, log in, and log out securely
  So that I can access features reserved for authenticated users

  Scenario: Successful account creation and login
    Given a new user provides a valid email and password
    When the user registers with the system
    Then the account should be created successfully
    And the user should be redirected to the login page

  Scenario: Login attempt with incorrect password
    Given a registered user exists with a valid email and password
    When the user attempts to log in with an incorrect password
    Then the system should deny access
    And an error message "Invalid credentials" should be displayed

  Scenario: User logout
    Given an authenticated user is logged in
    When the user chooses to log out
    Then the system should terminate the session
    And the user should be redirected to the home page

