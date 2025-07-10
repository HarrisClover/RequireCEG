Feature: Set High Attack Strength

  As a security analyst
  I want to perform a comprehensive vulnerability assessment
  So that I can identify and remediate potential vulnerabilities in the application

  Background:
    Given the scanning process is initiated with the 'High Attack Strength' setting
    And the system is equipped with automated tests targeting known vulnerabilities

  Scenario: Scenario 1: Identify Vulnerabilities
    Given the scanning process has started
    When the system executes a series of automated tests
    Then any potential vulnerabilities shall be flagged for immediate review
    And the vulnerabilities will detail their nature and severity

  Scenario: Scenario 2: No Medium or Higher Risk Vulnerabilities
    Given the scanning process is complete
    When the system checks for vulnerabilities of medium or higher risk
    Then the system will output a success message confirming application security is validated

  Scenario: Scenario 3: Risk Dependency Identification
    Given the scanning process has completed
    When the system verifies that vulnerabilities of medium or higher risk are present
    Then the system flags detected vulnerabilities
    And confirms there are no vulnerabilities of medium or higher risk

  Scenario: Scenario 4: Summary Report for High Risk Vulnerabilities
    Given the scanning process has completed with high risk vulnerabilities identified
    When the system analyzes the identified risks
    Then the system will provide a summary report highlighting high risk vulnerabilities
    And the summary will detail necessary remedial actions to be taken

  Scenario Outline: Scenario Outline: Vulnerability Assessment Results
    Given the scanning process has completed with <risk-level>
    When the system analyzes the identified risks
    Then the system shall provide a summary report highlighting risks
    Examples:
      | risk-level | summary |
      | medium | There are medium risk vulnerabilities that need attention |
      | high | High risk vulnerabilities have been identified and must be addressed |
      | low | No low or higher risk vulnerabilities found, application is secure |

