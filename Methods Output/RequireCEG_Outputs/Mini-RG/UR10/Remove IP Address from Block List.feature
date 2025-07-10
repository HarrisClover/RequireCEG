Feature: Remove IP Address from Block List

  As a system administrator
  I want to remove IP addresses from the block list
  So that I can manage access control effectively

  Background:
    Given that the block list is populated with IP addresses
    And the user has appropriate permissions to modify the block list

  Scenario: Valid IPv4 address removal
    Given the user submits a valid IPv4 address
    When the system validates the IP address
    Then the system checks if the IP address exists in the block list
    And the system removes the IP address and displays a confirmation message

  Scenario: Valid IPv6 address removal
    Given the user submits a valid IPv6 address
    When the system validates the IP address
    Then the system checks if the IP address exists in the block list
    And the system removes the IP address and displays a confirmation message

  Scenario: Invalid IP address format
    Given the user submits an invalid IP address
    When the system validates the IP address
    Then the system displays an error message prompting for a valid IP address

  Scenario: IP address not found in block list
    Given the user submits a valid IP address that is not in the block list
    When the system validates the IP address
    Then the system checks if the IP address exists in the block list
    And the system notifies the user that the IP address cannot be removed

  Scenario: IP address exists in block list
    Given the user submits a valid IP address that is in the block list
    When the system validates the IP address
    Then the system checks the IP address format is valid
    And the system removes the IP address and displays a confirmation message

  Scenario: User submits a non-blocked IP address
    Given the user submits a valid IP address that is not listed in the block list
    When the system validates the IP address
    Then the system displays an error message indicating that the IP address cannot be removed
