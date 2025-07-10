Feature: Identify Server-Side Inclusion vulnerabilities

  As a security analyst
  I want the application to detect potential Server-Side Inclusion vulnerabilities
  So that I can ensure the application is secure before deployment

  Background:
    Given the application is configured to use OWASP ZAP for vulnerability scanning
    And the application has security policies in place

  Scenario: Scenario 1: Detect vulnerabilities
    Given the application receives a request featuring an inclusion pattern
    When the automated scanning process is initiated
    Then the system should detect any potential Server-Side Inclusion vulnerabilities
    And an alert should indicate the severity level of the finding

  Scenario: Scenario 2: Generate report on medium or higher findings
    Given the scanning process identifies medium or higher severity vulnerabilities
    When the vulnerabilities are identified
    Then a detailed report should be generated documenting the findings

  Scenario: Scenario 3: Verify security policies
    Given there are no medium or higher severity vulnerabilities identified
    When the application checks the security policies
    Then the application should ensure appropriate enforcement of HTTP headers

  Scenario: Scenario 4: Ensure vulnerabilities are not present
    Given there are medium or higher severity vulnerabilities identified during the scan
    When the application verifies the absence of such vulnerabilities
    Then no vulnerabilities of medium or higher severity should be found
    And the security policies are verified accordingly

  Scenario Outline: Scenario Outline: Mitigation of vulnerabilities
    Given the application is operating under high attack strength settings
    And the user confirms vulnerability remediation
    When the system implements measures to mitigate risks
    Then the scanning process should be logged
    And a notification indicating successful mitigation is dispatched to the security team
    Examples:
      | Attack Strength | Vulnerability Severity | Mitigation Status |
      | high | medium | successful |
      | high | critical | successful |
      | medium | low | not applicable |

