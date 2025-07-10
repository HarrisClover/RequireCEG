Feature: Company Data Access Control
  As a system user,
  I want to access company data based on my privileges and the data's restrictions,
  So that I can view relevant company performance information while ensuring data security is maintained.

  Background:
    Given a system user is logged into the system

  Scenario: Accessing unrestricted data with full privilege
    Given the system user has "full access" privilege
    And the company data has no access restrictions
    When the user attempts to access the company data
    Then the user should be granted full access to the data

  Scenario: Accessing unrestricted data without specific privilege
    # Based on "I should be able to have full access to company data if company data has no restrictions to access."
    # This implies unrestricted data might be accessible regardless of specific privilege level (as long as user is authenticated).
    Given the system user does not necessarily have "full access" privilege
    And the company data has no access restrictions
    When the user attempts to access the company data
    Then the user should be granted full access to the data

  Scenario: Accessing restricted data with full privilege
    # Based on "I should be able to have full access to company data if company data has some restrictions to access."
    # This implies "full access" privilege might override specific restrictions. Requires clarification in a real scenario.
    Given the system user has "full access" privilege
    And the company data has some access restrictions (e.g., requires "Department Head" role)
    When the user attempts to access the company data
    Then the user should be granted full access to the data

  Scenario: Access Denied Due to Lacking General Full Access Privilege
    # Based on "I should not be able to have full access to company data if I do not have full access privilege to the data."
    Given the company data requires "full access" privilege
    And the system user does not have "full access" privilege
    When the user attempts to access the company data
    Then the user should not be granted full access to the data

  Scenario: Access Denied Due to Lacking Correct Specific Privilege for Restricted Data
    # Based on "I should not be able to have full access to company data if I do not have the correct access privilege to the data"
    Given the company data has access restrictions requiring a specific privilege (e.g., "Finance Role")
    And the system user has a different privilege (e.g., "Marketing Role") but not the required "Finance Role" privilege
    When the user attempts to access the company data
    Then the user should not be granted full access to the data