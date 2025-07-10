Feature: Deny Access to Company Data without Correct Privileges

  As a user
  I want to access company data
  So that I can retrieve necessary information for my tasks

  Background:
    Given the company data has certain restrictions
    And the user has specific access privileges

  Scenario: Scenario 1: Access Granted with Full Privileges
    Given a user with full access privileges
    When the user attempts to access the company data
    Then the user should see 'Access Granted: Welcome to Company Data'
    And the data should be fully accessible

  Scenario: Scenario 2: Access Denied without Full Privileges
    Given a user without full access privileges
    When the user attempts to access restricted company data
    Then the user should see 'Access Denied: Insufficient Privileges'

  Scenario: Scenario 3: Partial Access for Specific Privileges
    Given a user with specific access privileges
    When the user attempts to access company data with restrictions
    Then the user should access only parts of the data that match their privileges
    And the rest of the data should remain inaccessible

  Scenario: Scenario 4: Access Denied for Incorrect Privileges
    Given a user who does not have the correct access privileges for restricted company data
    When the user attempts to access those restricted areas
    Then the user should see 'Access Denied: Insufficient Privileges for restricted data.'
