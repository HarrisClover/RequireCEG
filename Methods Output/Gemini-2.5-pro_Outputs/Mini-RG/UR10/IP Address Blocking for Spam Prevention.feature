Feature: IP Address Blocking for Spam Prevention
  As a System Administrator
  I want to block website access for users based on their IP address
  So that I can prevent spamming and unwanted traffic from specific sources.

  Background:
    Given an IP blocklist exists in the system

  Scenario: Block access for a user whose IP is on the blocklist
    Given the IP address "198.51.100.10" is on the IP blocklist
    When a user attempts to access the website from IP address "198.51.100.10"
    Then their access should be denied

  Scenario: Allow access for a user whose IP is not on the blocklist
    Given the IP address "203.0.113.25" is not on the IP blocklist
    When a user attempts to access the website from IP address "203.0.113.25"
    Then their access should be granted

  # Optional: Scenario demonstrating an empty blocklist allows access
  Scenario: Allow access when the blocklist is empty
    Given the IP blocklist is empty
    When a user attempts to access the website from IP address "192.0.2.1"
    Then their access should be granted