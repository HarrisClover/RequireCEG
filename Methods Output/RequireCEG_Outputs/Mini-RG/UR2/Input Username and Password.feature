Feature: Input Username and Password

  As a user
  I want to create an account and log in
  So that I can access the system's features securely

  Background:
    Given the user is on the account creation page
    And the user has internet access

  Scenario: Scenario 1: Successfully creating an account
    Given the username does not already exist
    And the user enters a valid password
    When the user submits the account creation form
    Then the account should be created successfully
    And a success message should be displayed

  Scenario: Scenario 2: Attempting to create an account with an existing username
    Given the username already exists
    When the user tries to create the account
    Then the system should prompt the user to log in instead
    And a message indicating the account already exists should be displayed

  Scenario: Scenario 3: Invalid login attempt with existing username
    Given the username exists
    When the user enters an incorrect password
    Then the system should display an error message
    And the message should state 'Invalid username or password.'

  Scenario: Scenario 4: Profile creation without an existing account
    Given there is no existing account
    When the user attempts to create a profile
    Then the system should show a message
    And the message should state 'Please create an account first.'

  Scenario: Scenario 5: Attempting to recover credentials
    Given the user forgot their username or password
    When the user tries to create a profile
    Then the system should prevent account creation
    And the system should prompt the user to recover their credentials

  Scenario: Scenario 6: User provides an existing username
    Given the user provides an existing username
    Then the system should display 'Invalid username or password.'

  Scenario: Scenario 7: User forgets both username and password
    Given the user forgets their username
    And the user forgets their password
    When the user tries to recover their credentials
    Then the system should prompt the user to recover their credentials.
