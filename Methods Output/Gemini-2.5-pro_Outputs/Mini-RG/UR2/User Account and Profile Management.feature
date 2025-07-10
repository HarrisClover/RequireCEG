Feature: User Account and Profile Management
  As a user of the system
  I want to manage my account and profile
  So that I can access personalized features and content.

  Scenario: Successfully create a new account
    Given I do not have an existing account with the email "newuser@example.com"
    When I attempt to register with the email "newuser@example.com" and password "password123"
    Then my account should be created successfully
    And I should be logged in

  Scenario: Attempt to create an account with an existing email
    Given an account already exists with the email "existinguser@example.com"
    When I attempt to register with the email "existinguser@example.com" and password "newpassword"
    Then I should see an error message indicating the email is already registered
    And a new account should not be created

  Scenario: Successfully create a profile after creating an account
    Given I have successfully created an account with email "profileuser@example.com"
    And I am logged in
    When I navigate to the profile creation page
    And I enter my profile details
    And I submit the profile form
    Then my profile should be created successfully
    And my profile details should be saved

  Scenario: Attempt to create a profile without having an account
    Given I do not have an account
    When I attempt to navigate to the profile creation page
    Then I should be prompted to log in or create an account
    And I should not be able to create a profile

  Scenario: Attempt to create a profile when not logged in (e.g., forgot credentials)
    Given an account exists for "forgotuser@example.com"
    And I am not logged in
    When I attempt to navigate to the profile creation page
    Then I should be redirected to the login page
    And I should not be able to create a profile until I log in successfully