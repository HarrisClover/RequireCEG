Feature: Ensure No Blocking of IPs Not in Block List

  As a website administrator
  I want to verify user access based on IP address
  So that users can access the website without unnecessary blocks if their IP is not on the block list

  Background:
    Given the system has a list of blocked IP addresses
    And a user attempts to access the website

  Scenario: Scenario 1: IP Address is Blocked
    Given the user's IP address is on the blocking list
    When the user attempts to access the website
    Then the system should initiate the block process
    And display a message confirming that access is blocked due to the presence of the IP on the list

  Scenario: Scenario 2: IP Address is Not Blocked
    Given the user's IP address is not on the blocking list
    When the user attempts to access the website
    Then the system should allow access to the website
    And display a message indicating that no action has been taken as the IP is not blocked

  Scenario: Scenario 3: IP Address Negated on Block List
    Given the user's IP address is not found in the blocking list
    When the user attempts to access the website
    Then the system should allow access to the website
    And display a message indicating that no action has been taken as the IP is not blocked

  Scenario: Scenario 4: IP Address Found in Block List
    Given the user's IP address is found in the blocking list
    When the user attempts to access the website
    Then the system should initiate the block process
    And display a message confirming that access is blocked due to the presence of the IP on the list

  Scenario Outline: Scenario Outline: IP Check
    Given the user's IP address is <user-ip>
    And the blocking list contains <blocked-ips>
    When the user attempts to access the website
    Then the system should <block-status>
    Examples:
      | user-ip | blocked-ips | block-status |
      | 192.168.1.1 | 192.168.1.1, 192.168.1.2 | initiate the block process and display access blocked message |
      | 192.168.1.3 | 192.168.1.1, 192.168.1.2 | allow access and display no action message |
      | 10.0.0.5 | 10.0.0.5, 10.0.0.6 | initiate the block process and display access blocked message |

