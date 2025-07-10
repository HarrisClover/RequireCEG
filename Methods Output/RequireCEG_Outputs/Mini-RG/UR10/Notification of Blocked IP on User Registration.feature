Feature: Notification of Blocked IP on User Registration

  As a system administrator
  I want to prevent users with blocked IP addresses from registering
  So that I can reduce spam registrations and maintain security

  Background:
    Given the system has a predefined blocking list of IP addresses
    And the user attempts to register with a specific IP address

  Scenario: Blocked IP address attempts registration
    Given the user's IP address is on the blocking list
    When the user attempts to register
    Then the registration should fail
    And the notification 'Registration failed: Your IP address has been blocked due to spamming.' should be displayed

  Scenario: Allowed IP address attempts registration
    Given the user's IP address is not on the blocking list
    When the user attempts to register
    Then the registration should proceed successfully without any notifications

  Scenario: Blocked IP accesses website
    Given the user's IP address is on the blocking list
    When the user attempts to access the website
    Then the access should be denied
    And the message 'Access denied: Your IP has been blocked.' should be displayed

  Scenario: Blocked user registers from a different IP
    Given the user is blocked but attempts to register from a different, unblocked IP address
    When the user attempts to register
    Then the registration should proceed successfully without any issues

  Scenario: Blocked user from blocked IP makes another registration attempt
    Given the user's IP address is on the blocking list
    When the user attempts to register again
    Then the registration should fail again
    And the notification 'Registration failed: Your IP address has been blocked due to spamming.' should be displayed
