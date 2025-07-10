Feature: Check User Permissions

  As a bank account user
  I want to log in to my bank account and check my account balance
  So that I can manage my finances effectively

  Background:
    Given the user provides a username and password
    And the user is attempting to log in to their bank account

  Scenario: Scenario 1: Successful login with permission
    Given the username provided matches an existing account
    And the password provided is correct
    When the user logs in
    Then the user should be granted access to their bank account
    And the system should display the user's account balance

  Scenario: Scenario 2: Successful login without permission
    Given the username provided matches an existing account
    And the password provided is correct
    When the user logs in
    Then the user should be granted access to their bank account
    And the system should display a message indicating the user does not have permission to view their account balance

  Scenario: Scenario 3: Unsuccessful login due to incorrect username
    Given the username does not match any existing account
    When the user attempts to log in
    Then the system should display a message denying access to the bank account

  Scenario: Scenario 4: Unsuccessful login due to incorrect password
    Given the username is correct but the password is incorrect
    When the user attempts to log in
    Then the system should display a message denying access to the bank account

  Scenario: Scenario 5: Unsuccessful login due to no permission after successful login
    Given the username provided matches an existing account
    And the password provided is correct
    When the user logs in but lacks permissions
    Then the user should be granted access to their bank account
    And the system should indicate the user does not have permission to view their account balance

  Scenario Outline: Scenario Outline: Login Attempt
    Given the username is '<username>'
    And the password is '<password>'
    When the user attempts to log in
    Then the system should '<expectedOutcome>'
    Examples:
      | username | password | expectedOutcome |
      | validUser | validPass | grant access |
      | invalidUser | validPass | deny access |
      | validUser | invalidPass | deny access |
      | invalidUser | invalidPass | deny access |

