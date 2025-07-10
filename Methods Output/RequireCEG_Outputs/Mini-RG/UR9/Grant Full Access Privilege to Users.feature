Feature: Grant Full Access Privilege to Users

  As a user accessing company data
  I want to be granted appropriate access privileges based on my level of authorization
  So that I can efficiently access the necessary data while maintaining data security

  Background:
    Given a user attempts to log into the system
    And the user has a specific level of access privileges

  Scenario: Full Access with Unrestricted Data
    Given the user has been granted full access privileges
    And the data is unrestricted
    When the user attempts to access the company data
    Then the system should enable full access to all company data without any limitations.

  Scenario: Full Access with Restricted Data
    Given the user has been granted full access privileges
    And the data has some restrictions
    When the user attempts to access the company data
    Then the system should allow access to all company data while maintaining necessary restrictions.

  Scenario: Access Denied with Insufficient Privileges
    Given the user does not have full access privileges
    When the user attempts to access company data
    Then the system should deny access to all company data
    And the access denial message should be displayed stating, 'Access Denied: Insufficient Privileges.'

  Scenario: Partial Access with Valid Rights
    Given the user has partial access privileges and the correct access rights for restricted data
    When the user attempts to access the restricted data
    Then the system should permit access to the restricted data under existing constraints.

  Scenario: Access Denied with Incorrect Rights
    Given the user has partial access privileges but lacks the correct access rights for restricted data
    When the user attempts to access the restricted data
    Then the system should deny access to the restricted data
    And the access denial message should be displayed stating, 'Access Denied: Insufficient Privileges.'

  Scenario: Access Denied when User Lacks Correct Access Rights
    Given the user lacks the correct access rights for restricted data
    When the user attempts to access the company data with some restrictions
    Then the system should deny access and display the message: 'Access Denied: Insufficient Privileges.'

  Scenario: Access Denied when User Does Not Have Full Access Privileges
    Given the user does not have full access privileges
    When the user attempts to access the company data
    Then the system should deny access and display the message: 'Access Denied: Insufficient Privileges.'
