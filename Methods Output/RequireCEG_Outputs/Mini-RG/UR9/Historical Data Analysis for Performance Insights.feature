Feature: Historical Data Analysis for Performance Insights

  As a user
  I want to view historical performance data based on my access privileges
  So that I can understand the company's performance metrics within the allowed limits

  Background:
    Given the user attempts to access historical performance data
    And the company data may have access restrictions

  Scenario: Access granted with full privileges
    Given the user possesses full access privileges to company data
    When the user requests to view historical performance data
    Then the system displays all historical performance metrics without restriction

  Scenario: Access granted without restrictions
    Given the user lacks full access privileges
    And the company data has no restrictions
    When the user requests to view historical performance data
    Then the system presents all historical performance data to the user

  Scenario: Access granted with appropriate privileges
    Given the user lacks full access privileges
    And the company data has some restrictions
    When the user has the appropriate access privileges and requests to view historical performance data
    Then the system grants access to historical performance data

  Scenario: Access denied
    Given the user lacks full access privileges
    And the company data has some restrictions
    When the user requests to view historical performance data
    Then the system denies access
    And the system presents the message 'Access Denied: You do not have permission to view historical performance data.'

  Scenario: Unauthorized access attempt logging
    Given the user does not meet the criteria for access
    When the user attempts to view historical performance data
    Then the system logs the unauthorized access attempt for security auditing

  Scenario: Accessing data when there are restrictions
    Given the user lacks full access privileges
    And the company data has some restrictions
    When the user requests to view historical performance data
    Then the system denies access when the user lacks appropriate access privileges
    And the system logs the unauthorized access attempt for security auditing
