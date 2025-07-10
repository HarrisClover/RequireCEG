Feature: User Authentication
  As a user of the application
  I want to manage my account securely
  So that I can access protected features and maintain my identity.

  Background:
    Given the application is available

  Scenario: Successful User Registration
    Given I am not logged in
    When I navigate to the registration page
    And I enter a valid email "newuser@example.com" and password "password123"
    And I submit the registration form
    Then I should see a confirmation message indicating successful registration
    And I should be able to log in with "newuser@example.com" and "password123"

  Scenario: Successful Login for Registered User
    Given a user is registered with email "registered@example.com" and password "correct_password"
    And I am not logged in
    When I navigate to the login page
    And I enter the email "registered@example.com" and password "correct_password"
    And I submit the login form
    Then I should be logged in successfully
    And I should have access to authenticated features

  Scenario: Failed Login with Incorrect Password
    Given a user is registered with email "registered@example.com" and password "correct_password"
    And I am not logged in
    When I navigate to the login page
    And I enter the email "registered@example.com" and password "wrong_password"
    And I submit the login form
    Then I should see an error message indicating incorrect credentials
    And I should remain logged out

  Scenario: Successful Logout
    Given I am logged in as "registered@example.com"
    When I choose to log out
    Then I should be logged out successfully
    And I should not have access to authenticated features anymore