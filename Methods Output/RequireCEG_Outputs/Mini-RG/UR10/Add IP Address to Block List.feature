Feature: Add IP Address to Block List

  As a system administrator
  I want to manage a blocking list for IP addresses
  So that I can prevent unauthorized access to the website

  Background:
    Given a user interface to input an IP address
    And an existing blocking list of IP addresses

  Scenario: Scenario 1: Valid IP address not in blocking list
    Given the user inputs a valid IP address '192.168.1.1'
    And the IP address is not in the blocking list
    When the user submits the IP address
    Then the IP address is added to the blocking list
    And a success message is displayed indicating the IP has been successfully added.

  Scenario: Scenario 2: Valid IP address already in blocking list
    Given the user inputs a valid IP address '192.168.1.1'
    And the IP address is already in the blocking list
    When the user submits the IP address
    Then the system displays a message indicating that 'The IP address is already blocked.'

  Scenario: Scenario 3: Invalid IP address input
    Given the user inputs an invalid IP address '300.300.300.300'
    When the user submits the IP address
    Then the system displays an error message stating 'Invalid IP address input.'

  Scenario: Scenario 4: Attempt to add invalid IP address to block list
    Given the user inputs an invalid IP address '300.300.300.300'
    When the user submits the IP address
    Then the system displays an error message stating 'Invalid IP address input.'

  Scenario: Scenario 5: Attempt to add an already blocked IP address
    Given the user inputs a valid IP address '192.168.1.1'
    And the IP address is already in the blocking list
    When the user submits the IP address
    Then the system displays a message indicating that 'The IP address is already blocked.'

  Scenario Outline: Scenario Outline: Access attempt from blocked IP
    Given a user attempts to access the website from IP address '<ip-address>'
    When the system checks the blocking list
    Then the system denies access
    And displays a warning message stating 'Access denied: Your IP address is blocked from this website.'
    Examples:
      | ip-address |
      | 192.168.1.1 |
      | 10.0.0.5 |
      | 172.16.0.10 |

