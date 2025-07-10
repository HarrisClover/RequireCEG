Feature: HTTP Security Header Enforcement
  As a System Administrator,
  I want critical HTTP security headers to be implemented
  So that the application is protected against common web attacks like clickjacking and XSS.

  Scenario: Verify X-Frame-Options Header Presence
    Given a user accesses any page of the application
    When the HTTP response is received from the server
    Then the response headers must include 'X-Frame-Options' with a value of 'DENY' or 'SAMEORIGIN'.

  Scenario: Verify X-XSS-Protection Header Presence
    Given a user accesses any page of the application
    When the HTTP response is received from the server
    Then the response headers must include 'X-XSS-Protection' with a value indicating protection is enabled (e.g., '1; mode=block').

  Scenario: Verify HTTP Strict Transport Security (HSTS) Header Presence
    Given a user accesses the application via HTTPS
    When the HTTP response is received from the server
    Then the response headers must include 'Strict-Transport-Security' with a 'max-age' directive set to a sufficiently long duration (e.g., 'max-age=31536000'). # 1 year