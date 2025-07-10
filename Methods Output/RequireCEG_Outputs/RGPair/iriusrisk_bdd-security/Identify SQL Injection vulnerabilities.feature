Feature: Identify SQL Injection vulnerabilities

  As a system administrator
  I want the system to automatically trigger a security scan for SQL injection vulnerabilities when user input fails sanitization standards
  So that I can ensure the application is secure and protect it from potential threats

  Background:
    Given the system is configured with high attack strength and low alert thresholds
    And all security measures are actively enforced

  Scenario: Scenario 1: Input fails sanitization
    Given a user inputs a malicious SQL statement into the form
    When the system detects the input does not meet sanitization standards
    Then an automated security scan is triggered
    And an alert message stating 'SQL Injection vulnerability detected' is displayed prominently

  Scenario: Scenario 2: Input meets sanitization standards
    Given a user inputs a safe value into the form
    When the system processes the input
    Then no security scan is triggered

  Scenario: Scenario 3: Security scan identifies SQL injection points
    Given an automated security scan is triggered
    When the scan identifies potential SQL injection points
    Then an alert message stating 'SQL Injection vulnerability detected' is displayed prominently

  Scenario: Scenario 4: Mitigation of SQL injection risks
    Given no medium or higher risk vulnerabilities are present
    When the security measures are enforced
    Then the system effectively mitigates SQL injection risks

  Scenario Outline: Scenario Outline: SQL Injection Scan Results
    Given a user submits input '<user-input>'
    And the input is '<input-status>'
    When the system evaluates the input for sanitization
    Then the security scan's alert status is '<alert-status>'
    Examples:
      | user-input | input-status | alert-status |
      | ' OR '1'='1 | malicious | vulnerability detected |
      | username | safe | no vulnerabilities flagged |

