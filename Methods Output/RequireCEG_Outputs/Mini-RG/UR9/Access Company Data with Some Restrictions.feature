Feature: Access Company Data with Some Restrictions

  As a user
  I want to access company data based on my access privileges
  So that I can view the data I am authorized to see while protecting sensitive information

  Background:
    Given a user has been authenticated in the system
    And the user has specific access privileges defined

  Scenario: Scenario 1: Full Access Privileges
    Given the user has full access privileges
    When the user requests access to company data
    Then the user should have unrestricted access to all company data
    And no access restriction messages should be displayed

  Scenario: Scenario 2: Access to Unrestricted Data
    Given the company data has no access restrictions
    When the user tries to access the company data
    Then the user should access all data seamlessly

  Scenario: Scenario 3: Restricted Access Due to Limited Privileges
    Given the user does not have full access privileges
    When the user attempts to access restricted company data
    Then the user should receive a message denying access to that specific data set

  Scenario: Scenario 4: Mixed Access Privileges Scenario
    Given the user has partial access privileges to some data
    When the user tries to access a mix of restricted and unrestricted data
    Then the user should access unrestricted data only based on their privileges

  Scenario: Scenario 5: Evaluate Access Privileges for Restricted Data
    Given the user does not possess full access privileges
    When the user attempts to access a restricted data set
    Then the user should receive a denial message for specific data access

  Scenario: Scenario 6: Confirming Restrictions on Access Privileges
    Given company data contains both restricted and unrestricted portions
    When the user attempts to access either restricted or unrestricted data
    Then the system should analyze user access privileges to determine allowed unrestricted data
