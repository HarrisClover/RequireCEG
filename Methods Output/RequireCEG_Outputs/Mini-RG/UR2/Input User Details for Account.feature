Feature: Input User Details for Account

  As a user
  I want to create an account and manage my profile
  So that I can access exclusive features and personalize my shopping experience

  Background:
    Given the user is on the account creation page
    And the user has the option to log in or create a new account

  Scenario: Scenario 1: Existing Account
    Given the user attempts to create a new account
    And the user already has an existing account
    When the user submits the account creation form
    Then the system should display the message 'Account creation is not allowed as you already have an existing account.'

  Scenario: Scenario 2: Creating a Profile Without Account
    Given the user does not have an existing account
    When the user tries to create a profile
    Then the system should show the message 'Error: You must create an account before creating a profile.'

  Scenario: Scenario 3: Forgot Username/Password
    Given the user forgets their username and password
    When the user looks for their login details
    Then the system should provide an option to retrieve their login details
    And display the message 'Please use the 'Forgot Username/Password' feature to retrieve your login credentials.'

  Scenario: Scenario 4: Creating a Profile Successfully
    Given the user remembers their username and password
    When the user proceeds to create a profile
    Then the system should allow the profile creation
    And confirm the profile creation with the message 'Profile successfully created.'

  Scenario: Scenario 5: Invalid Login Attempt
    Given the user enters an incorrect username or password
    When the user tries to log in
    Then the system should show the error message 'Invalid username or password. Please try again.'

  Scenario: Scenario 6: Creating Profile with Remembered Credentials
    Given the user remembers their username and password
    And the user attempts to create a profile without an account
    When the user submits the profile creation form
    Then the system should show the message 'Error: You must create an account before creating a profile.'

  Scenario: Scenario 7: Invalid Input during Login
    Given the user enters an incorrect username or password
    When the user attempts to create an account
    Then the system does not allow account creation
