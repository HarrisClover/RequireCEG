Feature: Alert Admin of Blocked Access Attempts

  As a system administrator
  I want to be alerted when a user is blocked from accessing the website due to their IP address being in the blocking list
  So that I can monitor potentially malicious behavior and take appropriate action

  Background:
    Given the system maintains a list of blocked IP addresses
    And the system can generate alerts for blocked access attempts

  Scenario: Blocked User Access
    Given a user attempts to access the website from a blocked IP address
    When the system checks the user's IP address against the blocking list
    Then the user should be blocked from accessing the website
    And an alert is generated for the admin including the blocked IP address and the time of the attempt

  Scenario: Multiple Blocked Access Attempts
    Given a user attempts to access the website multiple times from the same blocked IP address within 5 minutes
    When the system detects multiple access attempts
    Then the system aggregates the attempts and alerts the admin of the total number of attempts

  Scenario: Blocked User Access Without Alert
    Given a user attempts to access the website from an IP address not in the blocking list
    When the system checks the user's IP address
    Then the user is granted access to the website without alerts

  Scenario: Aggregate Multiple Access Attempts
    Given a user attempts to access the website from a blocked IP address multiple times within a defined time frame
    When the system aggregates multiple blocked access attempts from the same IP address
    Then an alert is generated, notifying the admin of the total number of attempts made from the blocked IP
    And the alert includes the user's IP address and the time of the attempts
