Feature: Data Confidentiality and Integrity
  As a Security Team,
  I want sensitive data to be handled securely
  So that it is protected from unauthorized disclosure or caching.

  Scenario: Prevent Browser Caching of Sensitive Pages
    Given a user accesses a page containing sensitive information (e.g., account details, payment info)
    When the HTTP response for the sensitive page is received
    Then the response headers must include 'Cache-Control' directives instructing no caching (e.g., 'no-store, no-cache, must-revalidate')
    And the response headers should include 'Pragma: no-cache'
    And the response headers should include 'Expires' with a value of '0' or a date in the past.

  Scenario: Secure Transmission of Sensitive Data
    Given sensitive data (like passwords, PII, financial info) needs to be transmitted between client and server
    When the data transmission occurs
    Then the transmission must exclusively use the HTTPS protocol.