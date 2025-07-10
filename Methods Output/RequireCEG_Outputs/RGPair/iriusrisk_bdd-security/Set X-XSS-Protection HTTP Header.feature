Feature: Set X-XSS-Protection HTTP Header

  As a system administrator
  I want to ensure the X-XSS-Protection HTTP header is set correctly
  So that I can protect user data from Cross-Site Scripting (XSS) attacks

  Background:
    Given the application has been scanned for security vulnerabilities
    And the presence of the X-XSS-Protection header is being verified

  Scenario: Scenario 1: Set header when absent
    Given the X-XSS-Protection header is not present
    When the system sets the X-XSS-Protection header to '1; mode=block'
    Then the system confirms that security compliance is achieved
    And user data is more secure

  Scenario: Scenario 2: Log discrepancy when incorrect value present
    Given the X-XSS-Protection header is present with a value different from '1; mode=block'
    When the system detects the discrepancy
    Then the system logs a medium risk vulnerability

  Scenario: Scenario 3: Redirect when content is not served over HTTPS
    Given a user accesses the application from an untrusted source
    And the content is served over HTTP
    When the system checks whether the content is being served over HTTPS
    Then the system redirects the user’s request to HTTPS
    And to mitigate the risk of data exposure

  Scenario: Scenario 4: Verify presence of X-XSS-Protection header
    Given the X-XSS-Protection header is present
    When the system confirms the header value is '1; mode=block'
    Then security compliance is maintained
