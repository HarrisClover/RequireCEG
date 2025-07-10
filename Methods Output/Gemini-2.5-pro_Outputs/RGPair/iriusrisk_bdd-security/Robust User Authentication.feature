Feature: Robust User Authentication
  As a Security Team,
  I want secure user authentication mechanisms
  So that user accounts are protected against unauthorized access.

  Scenario: Enforce Case-Sensitive Passwords
    Given a user account exists with the username "TestUser" and the password "MyComplexP@ssword"
    When an authentication attempt is made with username "TestUser" and password "mycomplexp@ssword"
    Then the authentication attempt must fail.
    When an authentication attempt is made with username "TestUser" and password "MyComplexP@ssword"
    Then the authentication attempt must succeed.

  Scenario: Enforce HTTPS during Credential Transmission
    Given a user navigates to the application's login page
    When the user submits their username and password credentials
    Then the HTTP request containing the credentials must be sent over HTTPS.