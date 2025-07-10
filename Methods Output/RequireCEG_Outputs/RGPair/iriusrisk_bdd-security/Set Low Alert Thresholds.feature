Feature: Set Low Alert Thresholds

  As a security administrator
  I want to initiate an automated application security scanning process with OWASP ZAP that flags low-risk vulnerabilities
  So that I can ensure that only low-risk issues are reported unless higher risk vulnerabilities are detected

  Background:
    Given the OWASP ZAP scanning tool is configured with low alert thresholds
    And the policies for vulnerability classification are enabled

  Scenario: Scan with only low-risk vulnerabilities detected
    Given the system initiates an application security scan
    When the scan completes without any medium or higher risk vulnerabilities
    Then the system confirms a successful completion of the process
    And displays the message 'Scan completed successfully with only low-risk vulnerabilities detected.'

  Scenario: Scan with medium-risk vulnerabilities detected
    Given the system initiates an application security scan
    When the scan detects medium or higher risk vulnerabilities
    Then the scan will be terminated
    And the user is presented with a warning message stating 'Scan unsuccessful due to medium or high risk vulnerabilities detected.'

  Scenario: Scan with only low-risk vulnerabilities flagged
    Given the system initiates an application security scan
    When the scan detects only low risk vulnerabilities
    Then the scan results are logged for further analysis
    And the notifications for potential vulnerabilities recognized as low risk are triggered.

  Scenario: Scan with no vulnerabilities flagged
    Given the system initiates an application security scan
    When the scan completes without any vulnerabilities being flagged
    Then the system does not trigger notifications
    And the scan results are logged for further analysis.
