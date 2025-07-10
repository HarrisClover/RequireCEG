Feature: Conduct Scanning with Enabled Policies

  As a security analyst
  I want to ensure the application is secure from vulnerabilities
  So that we can protect the user data and maintain trust

  Background:
    Given the application is configured to enable scanning policies
    And the scanning process is initiated

  Scenario: Scan for Vulnerabilities
    Given the scan targets vulnerabilities like SQL injection and Cross-Site Scripting (XSS)
    And the scan focuses on high attack strength with low alert thresholds
    When the system detects any vulnerabilities categorized as medium risk or higher
    Then the system shall raise an alert for remediation
    And the alert shall include the type and severity of each identified vulnerability

  Scenario: Confirm Security Standards
    Given the scan results show no vulnerabilities at medium risk or above
    Then the system shall confirm that the application meets the defined security standards
    And the application is deemed secure

  Scenario: Log and Notify After Successful Scan
    Given the scan results are comprehensive and include vulnerability details
    And remediation actions taken are logged
    When the scanning process completes
    Then the system shall log the comprehensive scan results
    And the system shall notify the security team for their review and further action

  Scenario: Handle Vulnerabilities Detected
    Given vulnerabilities detected during the scan have a high attack strength with low alert thresholds
    When the system detects vulnerabilities categorized as medium risk or higher
    Then the system shall raise an alert for remediation detailing the type and severity of each identified vulnerability

  Scenario: Check for No Medium Risk Vulnerabilities
    Given the security scanning process has been initiated with the application configured to enable scanning policies
    When no vulnerabilities are found at medium risk or above after the scan
    Then the system logs the comprehensive scan results, including vulnerability details and remediation actions taken
    And the system notifies the security team for review and further action

  Scenario Outline: Log and Notify After Successful Scan
    Given the scan results are comprehensive and include vulnerability details
    And remediation actions taken are logged
    When the scanning process completes
    Then the system shall log the comprehensive scan results
    And the system shall notify the security team for their review and further action
    Examples:
      | scan-result | vulnerability-detail | remediation-action | notification-status |
      | secure | no vulnerabilities | N/A | notification sent |
      | vulnerable | SQL injection detected | patch applied | notification sent |
      | vulnerable | XSS detected | fix deployed | notification sent |

