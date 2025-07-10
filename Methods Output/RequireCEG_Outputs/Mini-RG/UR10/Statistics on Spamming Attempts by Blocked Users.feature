Feature: Statistics on Spamming Attempts by Blocked Users

  As an admin
  I want to monitor spamming activities from blocked IP addresses
  So that I can take necessary actions to prevent abuse on the system

  Background:
    Given the system has a list of blocked IP addresses
    And the spamming attempts counter is initialized for each blocked IP

  Scenario: Blocked IP Attempt Access
    Given a user with a blocked IP address attempts to access the website
    When the system checks the IP address against the block list
    Then the spamming attempts counter for that IP should increment
    And a spamming attempt should be logged with the timestamp and action type

  Scenario: Non-Blocked IP Attempt Access
    Given a user with a non-blocked IP address attempts to access the website
    When the system checks the IP address against the block list
    Then no spamming attempts should be recorded
    And the user should be granted normal access

  Scenario: Admin Views Spamming Statistics
    Given an admin requests to view statistics
    When the admin selects a blocked IP address
    Then the system should display the total number of spamming attempts for that IP address
    And detailed statistics, including timestamps and actions for that IP address

  Scenario: User with Blocked IP and Multiple Attempts
    Given a user with a blocked IP address attempts to access the website multiple times
    When the system processes each access attempt
    Then the spamming attempts counter should correctly reflect the number of attempts made
    And each attempt should be logged with correct timestamps and action types

  Scenario: Logged Attempts Not Exceeding Maximum Limit
    Given the total recorded spamming attempts for a blocked IP address does not exceed the maximum allowed
    When an admin views statistics for that IP address
    Then the system should display the total without any restrictions

  Scenario Outline: Admin Views Spamming Statistics for Different IPs
    Given an admin requests to view statistics
    When the admin selects a blocked IP address <blocked-ip>
    Then the system should display the total number of spamming attempts for <blocked-ip>
    And detailed statistics, including timestamps and actions for <blocked-ip>
    Examples:
      | blocked-ip | total-attempts |
      | 192.168.1.1 | 5 |
      | 10.0.0.2 | 3 |
      | 172.16.0.5 | 8 |

