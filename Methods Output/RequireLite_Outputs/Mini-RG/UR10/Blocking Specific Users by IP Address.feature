Feature: Blocking Specific Users by IP Address

  As a store owner
  I want to block specific users based on IP address
  So that I can prevent spamming on the website

  Background:
    Given that the blocking list is initialized
    And the system has access to user IP addresses

  Scenario: Scenario 1: Block a user on the blocking list
    Given the user IP address is on the blocking list
    When the user attempts to access the website
    Then the user should be blocked from accessing the website
    And the user should receive a clear block message indicating the reason for the block

  Scenario: Scenario 2: Allow a user not on the blocking list
    Given the user IP address is not on the blocking list
    When the user attempts to access the website
    Then the user should be allowed to access the website under defined conditions

  Scenario Outline: Scenario Outline: Blocking users based on IP address
    Given the user IP address is <ip-address>
    When the user attempts to access the website
    Then the user should be <expected-outcome>
    And the blocking list contains <status>
    Examples:
      | ip-address | status | expected-outcome |
      | 192.168.1.1 | blocked | blocked |
      | 192.168.1.2 | not_blocked | allowed |
      | 10.0.0.1 | blocked | blocked |
      | 10.0.0.2 | not_blocked | allowed |
      | 10.10.10.0 | blocked | blocked |
      | 172.16.0.1 | not_blocked | allowed |

