Feature: View Block List

  As a system administrator
  I want to manage IP addresses by blocking and unblocking them
  So that I can prevent unauthorized access to the system

  Background:
    Given the system has a block list of IP addresses
    And the user is logged into the system

  Scenario: View Block List
    Given the user accesses the block list
    When the block list is retrieved
    Then all currently blocked IP addresses are displayed

  Scenario: Attempt to block an already blocked IP
    Given the user attempts to block an IP address that is already in the block list
    When the user tries to block the IP address again
    Then the system outputs 'The IP address is already blocked.'

  Scenario: Block a valid IP address
    Given the user provides a valid IP address not in the block list
    When the user confirms the action to block the IP address
    Then the IP address is added to the block list
    And a success message is displayed

  Scenario: Block an invalid IP address
    Given the user provides an invalid IP address format
    When the user attempts to block the IP address
    Then the system outputs the message 'Invalid IP format.'

  Scenario: Remove an IP address from the block list
    Given the user opts to remove an IP address from the block list
    When the user attempts to remove the IP address that is currently in the block list
    Then the system prompts for confirmation to remove the IP address
    And if confirmed, the IP address is removed from the block list and a success message is displayed

  Scenario: Attempt to remove an IP address that is not blocked
    Given the user wants to remove an IP address that is not in the block list
    When the user attempts to remove the IP address
    Then the system displays 'The IP address is not in the block list.'

  Scenario: Block with invalid IP and receive an error message
    Given the user provides an invalid IP address format
    When the user attempts to block this invalid IP address
    Then the system outputs the message 'Invalid IP format.'

  Scenario: Confirm action to block an IP address
    Given the user provides a valid IP address and confirms the action
    When the user attempts to block the IP address
    Then the system adds the IP address to the block list and displays a success message.

  Scenario: Remove non-existent IP address
    Given the user wants to remove an IP address that does not exist in the block list
    When the user attempts to remove the IP address
    Then the system outputs 'The IP address is not in the block list.'
