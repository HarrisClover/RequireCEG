Feature: Set Strict-Transport-Security HTTP Header

  As a system administrator
  I want to ensure secure connections by enforcing Strict-Transport-Security
  So that I can protect users from man-in-the-middle attacks

  Background:
    Given the security policy mandates the enforcement of the Strict-Transport-Security header
    And the application is running on a server that supports HTTPS

  Scenario: Scenario 1: Header Not Present
    Given the Strict-Transport-Security header is absent
    When a user attempts to access the application
    Then a warning message 'Strict-Transport-Security header not enforced; your connection may be vulnerable to man-in-the-middle attacks.' should be displayed

  Scenario: Scenario 2: Invalid Duration Parameter
    Given the Strict-Transport-Security header is present but the duration is not set or is zero
    When the header is processed
    Then a message 'Invalid duration for Strict-Transport-Security header; please specify a non-zero duration.' should be issued

  Scenario: Scenario 3: Valid Duration Parameter
    Given the Strict-Transport-Security header is present with a valid duration greater than zero
    When the header is processed
    Then HTTPS will be enforced for all connections for the specified duration
    And the policy is cached in the user's browser for the specified duration

  Scenario: Scenario 4: Accessing via HTTP
    Given the Strict-Transport-Security header is in effect with a valid duration set
    When a user attempts to access the application via HTTP
    Then the request should be blocked with a message 'HTTP requests are blocked; please use HTTPS to access this application.'

  Scenario Outline: Scenario Outline: Testing Various Durations
    Given the Strict-Transport-Security header is present with duration set to <duration>
    When the header is processed
    Then the system should enforce HTTPS for all connections for <duration> duration
    Examples:
      | duration |
      | 0 |
      | -1 |
      | 30 |
      | 3600 |


  Scenario: Scenario 5: Header Present with Zero Duration
    Given the Strict-Transport-Security header is present but with zero duration
    When the header is processed
    Then a message 'Invalid duration for Strict-Transport-Security header; please specify a non-zero duration.' should be issued

  Scenario: Scenario 6: Header Present with Duration Greater than Zero
    Given the Strict-Transport-Security header is present with duration set to positive value
    When the user accesses the application via HTTPS
    Then HTTPS will be enforced for the specified duration
    And the policy should be cached in the user's browser

  Scenario: Scenario 7: Accessing via HTTP with Header in Effect
    Given the Strict-Transport-Security header is in effect with a valid duration set
    When the user attempts to access the site via HTTP
    Then a message 'HTTP requests are blocked; please use HTTPS to access this application.' should be displayed
