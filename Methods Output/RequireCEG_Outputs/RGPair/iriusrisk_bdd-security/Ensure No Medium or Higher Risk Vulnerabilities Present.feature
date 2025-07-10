Feature: Ensure No Medium or Higher Risk Vulnerabilities Present

  As a security compliance officer
  I want to ensure that all vulnerabilities detected by OWASP ZAP are resolved before production
  So that the application remains secure and protects user data

  Background:
    Given an application is prepared for a security scan
    And the OWASP ZAP tool is configured with enabled policies and high attack strength

  Scenario: Scan and Notify on Vulnerabilities
    Given the security scan has been completed
    And medium or higher risk vulnerabilities are detected
    When the system generates a notification indicating the specific vulnerabilities
    Then the development team receives a notification detailing the specific vulnerabilities
    And the application is prevented from proceeding to production until all vulnerabilities are resolved

  Scenario: Resolution of Vulnerabilities
    Given the development team addresses all identified vulnerabilities
    When a subsequent scan is conducted
    Then only lower than medium risk vulnerabilities should be present
    And the application is successfully marked as secure for deployment

  Scenario: Periodic Security Measure Check
    Given the application undergoes periodic checks for security measures such as proper HTTP headers
    And the system evaluates the effectiveness of these measures for monthly
    When the application’s security measures are found effective
    Then the likelihood of future medium or higher risk vulnerabilities will be lowered

  Scenario: All Vulnerabilities Must Be Resolved Before Production
    Given all identified vulnerabilities are not resolved
    When a security scan is completed
    Then the application must not proceed to production

  Scenario: Subsequent Security Scan After Resolution
    Given all previously identified vulnerabilities are addressed
    When a subsequent security scan is performed after vulnerabilities are addressed
    Then the application is marked as secure for deployment
    And no medium or higher risk vulnerabilities are present
