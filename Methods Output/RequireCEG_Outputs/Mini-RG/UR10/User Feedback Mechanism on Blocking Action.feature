Feature: User Feedback Mechanism on Blocking Action

  As a user
  I want to block IP addresses effectively
  So that I can manage unwanted connections efficiently

  Background:
    Given the blocking list is initialized
    And the user is authenticated

  Scenario: Scenario 1: Blocking an IP Address that is already on the list
    Given the IP address 192.168.1.1 is present on the blocking list
    When the user attempts to block the IP address 192.168.1.1
    Then the system should update the list
    And the message 'User has been successfully blocked.' should be displayed

  Scenario: Scenario 2: Attempting to block an IP Address that is not on the list
    Given the IP address 172.16.0.1 is not present on the blocking list
    When the user attempts to block the IP address 172.16.0.1
    Then the system should not alter the list
    And the message 'Cannot block this IP address; it is not on the blocking list.' should be displayed

  Scenario: Scenario 3: Viewing an empty blocking list status message
    Given the blocking list is empty
    Then the system should present the message 'There are currently no IP addresses on the blocking list.'

  Scenario: Scenario 4: Viewing a non-empty blocking list status message
    Given the IP address 10.0.0.1 is present on the blocking list
    When the user views the blocking list
    Then the system should return the message 'You have 1 IP addresses currently blocked.'

  Scenario: Scenario 5: Attempting to block an IP Address when the blocking list is empty
    Given the blocking list is empty
    When the user attempts to block any IP address
    Then the system should present the message 'There are currently no IP addresses on the blocking list.'
