Feature: Access Company Data with Full Privileges

  As a user
  I want to access company data based on my privileges
  So that I can perform my job without facing access issues

  Background:
    Given the user is logged into the system
    And the user's access privileges are evaluated

  Scenario: Scenario 1: User with Full Access
    Given the user has full access privilege
    When the user tries to access company data
    Then the system should grant access
    And the system should display 'Access Granted: You have full access to all company data.'

  Scenario: Scenario 2: User without Full Access
    Given the user does not possess full access privilege
    When the user tries to access company data
    Then the system should deny access
    And the system should display 'Access Denied: You do not have the necessary privileges to access the company data.'

  Scenario: Scenario 3: User with Restricted Access Privileges Granted Access to Restricted Data
    Given the company data has specific restrictions
    And the user possesses the correct access privileges for restricted company data
    When the user tries to access restricted company data
    Then the system should validate the user's privileges
    And the system should display 'Access Granted: You have access to the restricted company data.'

  Scenario: Scenario 4: User without Appropriate Privileges for Restricted Data
    Given the company data has specific restrictions
    And the user lacks the appropriate access privileges for restricted company data
    When the user tries to access restricted company data
    Then the system should deny access
    And the system should display 'Access Denied: You do not have the necessary privileges to access the company data.'

  Scenario: Scenario 5: User with Missing Privileges for Access
    Given the user does not possess full access privilege
    When the user tries to access company data
    Then the system should deny access
    And the system should display 'Access Denied: You do not have the necessary privileges to access the company data.'
