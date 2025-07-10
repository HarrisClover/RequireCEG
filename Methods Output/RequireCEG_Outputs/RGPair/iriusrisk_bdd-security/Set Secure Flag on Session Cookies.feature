Feature: Set 'Secure' Flag on Session Cookies

  As a security officer
  I want to ensure that session cookies are secure and sensitive data is protected
  So that user sessions are secure and sensitive information is not compromised

  Background:
    Given the user is logged into the system
    And the system has a session cookie set

  Scenario: Scenario 1: Secure flag is set
    Given the session cookie is created with the 'secure' flag
    When the user accesses the application over HTTPS
    Then the session cookie is transmitted securely
    And the logout process is executed properly

  Scenario: Scenario 2: Logout invalidates session
    Given the user logs out of the system
    When the session ID is invalidated
    Then all session cookies associated with that ID are removed

  Scenario: Scenario 3: Insecure flag alert
    Given the user logs out and the session cookie does not have the 'secure' flag set
    When the logout process is completed
    Then the system alerts the security team to rectify the issue immediately

  Scenario: Scenario 4: Flagging sensitive data
    Given sensitive data is being transmitted
    When the application detects this situation
    Then all session cookies are flagged as 'httpOnly' to prevent access through JavaScript

  Scenario: Scenario 5: Secure flag state verification
    Given the session cookie has the 'secure' flag set as true
    When the user tries to log out
    Then the session must remain valid until logout is completed

  Scenario: Scenario 6: Insecure flag detection
    Given the session cookie does not have the 'secure' flag set after logout
    When the security check is performed
    Then the system alerts the security team to rectify the issue immediately

  Scenario Outline: Scenario Outline: Secure session validity
    Given the session cookie <session-type> has the 'secure' flag
    And the sensitive data transmission is <sensitive-data>
    When the user tries to log out
    Then the logout process is <logout-status>
    Examples:
      | session-type | sensitive-data | logout-status |
      | set | true | executed successfully |
      | unset | true | not executed |
      | set | false | not executed |
      | unset | false | not executed |

