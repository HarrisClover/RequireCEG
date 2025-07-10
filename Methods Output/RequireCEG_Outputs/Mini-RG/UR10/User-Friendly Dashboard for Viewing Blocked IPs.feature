Feature: User-Friendly Dashboard for Viewing Blocked IPs

  As a user managing IP addresses
  I want to block and unblock IP addresses from a predefined list
  So that I can manage access effectively and ensure system security

  Background:
    Given there is a predefined blocking list of IP addresses
    And the user is logged into the system

  Scenario: Scenario 1: Successfully blocking an IP address
    Given the IP address 192.168.1.1 is in the blocking list
    When the user attempts to block the IP address 192.168.1.1
    Then the system successfully blocks the IP address and displays the message 'The IP address has been blocked successfully'

  Scenario: Scenario 2: Attempting to block a non-existent IP address
    Given the IP address 10.0.0.1 is not in the blocking list
    When the user attempts to block the IP address 10.0.0.1
    Then the system generates an error message indicating the failure with 'This IP address cannot be blocked'

  Scenario: Scenario 3: Unblocking a blocked IP address
    Given the user accesses the dashboard and sees the blocked IP addresses
    And the IP address 192.168.1.1 is on the list
    When the user chooses to unblock the IP address 192.168.1.1
    Then the system confirms the unblocking action with the message 'The IP address has been unblocked successfully'

  Scenario Outline: Scenario Outline: Attempting to block multiple IP addresses
    Given the IP address <ip-address> is <status> the blocking list
    When the user attempts to block the IP address <ip-address>
    Then the outcome should be <outcome>
    Examples:
      | ip-address | status | outcome |
      | 192.168.1.1 | in | the system successfully blocks the IP address and displays the message 'The IP address has been blocked successfully' |
      | 10.0.0.1 | not in | the system generates an error message indicating the failure with 'This IP address cannot be blocked' |

