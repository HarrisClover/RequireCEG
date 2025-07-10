Feature: Check if an IP Address is Blocked

  As a website user
  I want to access the website without being denied due to my IP address being blocked
  So that I can use the website freely if my IP address is not associated with spamming behavior

  Background:
    Given the user attempts to access the website
    And the system has a block list of IP addresses

  Scenario: Scenario 1: Access denied due to blocked IP address
    Given the user's IP address is found on the blocking list
    When the user attempts to access the website
    Then access is denied
    And the system displays a message indicating that access is denied due to spamming behavior

  Scenario: Scenario 2: Access granted for unblocked IP address
    Given the user's IP address is not found on the blocking list
    When the user attempts to access the website
    Then access is granted

  Scenario: Scenario 3: Access granted after removal from block list
    Given the user's previously blocked IP address has been removed from the blocking list
    When the user attempts to access the website
    Then access is granted
    And the system displays a message confirming that the user has been removed from the block list

  Scenario: Scenario 4: Access denied due to removed block list
    Given the user's previously blocked IP address has not been removed from the blocking list
    When the user attempts to access the website
    Then access is denied
    And the system displays a message indicating that access is denied due to spamming behavior
