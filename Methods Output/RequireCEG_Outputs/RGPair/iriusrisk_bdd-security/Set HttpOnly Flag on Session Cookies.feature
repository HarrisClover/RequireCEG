Feature: Set 'HttpOnly' Flag on Session Cookies

  As a security-conscious application user
  I want to ensure that session cookies have the HttpOnly flag set and are protected
  So that my credentials and sensitive information are protected against XSS attacks

  Background:
    Given the user is logged into the system
    And the system has configured cookies to enforce security standards

  Scenario: Scenario 1: Successful User Login
    Given the user logs into the system successfully
    Then the 'HttpOnly' flag should be set on the session cookies
    And the session ID should be valid

  Scenario: Scenario 2: User Logout Action
    Given the user initiates a logout action
    Then the current session ID should be invalidated
    And the 'HttpOnly' flag should remain active for any new sessions created after logout

  Scenario: Scenario 3: Automated Inactivity Logout
    Given the user remains inactive for a predefined timeout period
    When the timeout is triggered
    Then the session should be automatically invalidated
    And the 'HttpOnly' flag should be retained for all active session cookies

  Scenario: Scenario 4: Unauthorized Access Attempt
    Given the 'HttpOnly' flag is set on session cookies
    When an unauthorized attempt is made to access session cookies via JavaScript
    Then the system should deny access to the session cookies

  Scenario: Scenario 5: Session Cookie Retention Post Logout Action and Invalid Session Handling During Inactivity Timeout
    Given the user has logged out
    When the user attempts to access a new session after logout
    Then the session cookies should still have the 'HttpOnly' flag set
    And there should be no valid session ID available

  Scenario Outline: Scenario Outline: Security Verification for Session Cookies
    Given the session is active with 'HttpOnly' enabled
    And the timeout period is <timeout-period> minutes
    When the user <action>
    Then the session should <result>
    Examples:
      | timeout-period | action | result |
      | 5 | remains inactive | be invalidated |
      | 10 | logs out | invalidate the session ID |
      | 20 | attempts unauthorized access | deny access to cookies |

