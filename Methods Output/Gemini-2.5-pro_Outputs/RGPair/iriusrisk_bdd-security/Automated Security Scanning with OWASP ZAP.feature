Feature: Automated Security Scanning with OWASP ZAP
  As a Security Team,
  I want the system to undergo automated security scanning using OWASP ZAP
  So that common web vulnerabilities are identified and addressed proactively.

  Scenario: Execute OWASP ZAP Scan with Secure Configuration
    Given the OWASP ZAP scanner is integrated into the CI/CD pipeline or deployment process
    And the ZAP scan is configured with enabled policies covering OWASP Top 10 and other relevant checks
    And the ZAP scan attack strength is set to 'High'
    And the ZAP scan alert threshold is set to 'Low'
    When an automated security scan is triggered against the application
    Then the scan should execute successfully, covering key application endpoints
    And the scan should check for vulnerabilities including SQL injection, Cross-Site Scripting (XSS), path traversal, remote file inclusion, server-side inclusion, code injection, and remote OS command injection.

  Scenario: Verify Scan Results for Critical Vulnerabilities
    Given a completed OWASP ZAP scan report is available for the application
    When the scan report is analyzed
    Then the report must not contain any vulnerabilities classified as 'High' risk
    And the report must not contain any vulnerabilities classified as 'Medium' risk.