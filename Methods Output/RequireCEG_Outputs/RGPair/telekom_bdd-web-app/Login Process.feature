Feature: Login Process

  As a user of the system
  I want to log in using my username and password
  So that I can access my account and navigate the system

  Background:
    Given the system is available for login
    And I have a registered account

  Scenario: Successful login with valid credentials
    Given I enter a valid username and password
    When I submit the login form
    Then I should gain access to my account
    And the system should maintain my session

  Scenario: Login attempt with invalid credentials
    Given I enter a username that exists in the system
    And I enter an incorrect password
    When I submit the login form
    Then the system should display an error message stating 'Invalid credentials, please try again.'

  Scenario: Login attempt with nonexistent account
    Given I enter a username that does not exist in the system
    When I submit the login form
    Then the system should display 'No account found. Please create a new account.'

  Scenario: Login attempt with JavaScript disabled
    Given I have disabled JavaScript in my browser
    When I attempt to log in
    Then the system should inform me with the message 'Please enable JavaScript for optimal functionality.'

  Scenario: Session expiration
    Given I am logged into the system
    When my session times out
    Then the system should prompt me to log in again with the message 'Please log in again.'

  Scenario Outline: Session management during navigation
    Given I am logged into the system
    And I navigate away from the login page
    When I return to the login page
    Then my session should still be active
    Examples:
      | username | session state |
      | validUser | active |
      | anotherUser | active |


  Scenario: Login attempt with valid username and correct password
    Given I enter a valid username
    And I enter the correct password
    When I submit the login form
    Then I should be granted access to my account
    And the system should maintain my session state
