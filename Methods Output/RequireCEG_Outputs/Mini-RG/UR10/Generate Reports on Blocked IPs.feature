Feature: Generate Reports on Blocked IPs

  As a system administrator
  I want to generate detailed reports of blocked IP addresses
  So that I can monitor and manage access to the website effectively

  Background:
    Given the system has a predefined blocking list of IP addresses
    And the system can log events related to blocked user access

  Scenario: Scenario 1: Blocked IP Found
    Given a user attempts to access the website with a blocked IP address
    When the system checks the user's IP address
    Then the user's IP address is logged as blocked
    And an admin is notified about the blocked IP address

  Scenario: Scenario 2: IP Not Blocked
    Given a user attempts to access the website with a non-blocked IP address
    When the system checks the user's IP address
    Then the access attempt is allowed
    And no log is created for blocked IPs

  Scenario: Scenario 3: Generate Summary Report of Blocked IPs
    Given the admin requests a summary report of blocked IP addresses
    When the system generates the summary report
    Then the report includes all blocked IP addresses, total number of block events, and user activity logged before each block

  Scenario: Scenario 4: Generate Summary Report When Requested
    Given there exists a summary report of blocked IPs
    When an admin requests the summary report
    Then the summary report is generated which includes a list of blocked IPs and timestamps
