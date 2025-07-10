Feature: Validate User IP Address Before Blocking

  As a user attempting to block an IP address
  I want to ensure that the IP address exists in the blocking list before blocking it
  So that I can manage the blocking list effectively and avoid errors

  Background:
    Given a user logs into the system
    And the user has admin privileges

  Scenario: Scenario 1: Successfully block an existing IP address
    Given the IP address '192.168.1.1' is already in the blocking list
    When the user attempts to block the IP address '192.168.1.1'
    Then a confirmation message should indicate the IP address has been successfully blocked
    And the blocking list should remain unchanged

  Scenario: Scenario 2: IP address not found in blocking list
    Given the IP address '10.0.0.1' is not in the blocking list
    When the user attempts to block the IP address '10.0.0.1'
    Then an error message should state that blocking is not possible because the IP address is not found

  Scenario: Scenario 3: Attempting to add an IP address already in the blocking list
    Given the IP address '192.168.1.2' is already in the blocking list
    When the user attempts to add the IP address '192.168.1.2'
    Then an error message should state that the IP address cannot be added because it is already in the blocking list

  Scenario: Scenario 4: Attempting to remove an IP address that exists in the blocking list
    Given the IP address '192.168.1.1' is in the blocking list
    When the user attempts to remove the IP address '192.168.1.1'
    Then a success message should indicate that the IP address has been successfully removed from the blocking list

  Scenario: Scenario 5: Attempting to remove an IP address not in the blocking list
    Given the IP address '10.0.0.1' is not in the blocking list
    When the user attempts to remove the IP address '10.0.0.1'
    Then an error message should state that the IP address is not in the blocking list, hence cannot be removed

  Scenario Outline: Scenario Outline: Manage the blocking list
    Given the IP address '<ip-address>' is <status> in the blocking list
    When the user <action> the IP address '<ip-address>'
    Then the system should display <message>
    Examples:
      | ip-address | status | action | message |
      | 192.168.1.1 | found | removes | The IP address '192.168.1.1' has been successfully removed from the blocking list |
      | 10.0.0.1 | not found | removes | Error: The IP address '10.0.0.1' is not in the blocking list |
      | 192.168.1.2 | found | adds | The IP address '192.168.1.2' has been successfully added to the blocking list |
      | 10.0.0.2 | not found | adds | Error: The IP address '10.0.0.2' cannot be added because it is already in the list |

