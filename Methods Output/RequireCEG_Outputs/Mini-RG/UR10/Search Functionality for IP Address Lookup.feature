Feature: Search Functionality for IP Address Lookup

  As a system administrator
  I want to validate and block IP addresses
  So that I can manage access and improve security

  Background:
    Given the system has a predefined blocking list
    And the format for an IP address is defined

  Scenario: Scenario 1: Validate an invalid IP address
    Given the input IP address is '999.999.999.999'
    When the system checks the IP address format
    Then the system should display an error message indicating invalid IP format
    And the system should confirm that blocking cannot occur due to invalid IP format

  Scenario: Scenario 2: Block an IP address found in the blocking list
    Given the input IP address is '192.168.1.10'
    And the IP address is found on the blocking list
    When the system prompts for confirmation to block the IP address
    Then the system should allow the user to proceed with blocking
    And confirm that the user has been successfully blocked

  Scenario: Scenario 3: IP address not found in the blocking list
    Given the input IP address is '10.0.0.5'
    When the system checks the IP address against the blocking list
    Then the system should display a message stating blocking cannot occur

  Scenario: Scenario 4: Validate a valid and blockable IP address
    Given the input IP address is '172.16.0.10'
    And the IP address is found on the blocking list
    When the system prompts for confirmation to block the IP address
    Then the system should allow the user to proceed with blocking
    And confirm that the user has been successfully blocked

  Scenario Outline: Validate and block multiple IP addresses
    Given the input IP address is '<ip-address>'
    When the system checks if the IP address is valid
    Then the system should <expected-result>
    Examples:
      | ip-address | expected-result |
      | 192.0.2.1 | allow blocking if found in the list |
      | 255.255.255.256 | display error message |
      | 172.16.0.1 | allow blocking if found in the list |
      | 2001:0db8:85a3:0000:0000:8a2e:0370:7334 | allow if valid IPv6 address |
      | invalid_ip | display error message |

