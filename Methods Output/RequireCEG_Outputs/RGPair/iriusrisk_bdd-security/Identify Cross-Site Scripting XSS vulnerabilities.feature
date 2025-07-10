Feature: Identify Cross-Site Scripting (XSS) vulnerabilities

  As a system administrator
  I want to ensure user inputs are validated and free from XSS vulnerabilities
  So that the application remains secure and protects users from harmful scripts

  Background:
    Given the application is running with security protocols in place
    And the system has defined tags and constructs that are considered harmful

  Scenario: Valid input submission without harmful tags
    Given a user enters a safe input string
    When the user submits the input
    Then the input should be processed and stored successfully
    And the system should display a success message

  Scenario: Input submission containing harmful script tags
    Given a user enters an input string with <script> tags
    When the user submits the input
    Then the submission should be blocked
    And the user should see an error message suggesting to remove harmful content

  Scenario: Input submission containing harmful content as defined
    Given a user enters an input string with <iframe> tags
    When the user submits the input
    Then the submission should be blocked
    And the user should see an error message suggesting to remove harmful content

  Scenario: Input submission with encoded HTML entities
    Given a user enters an input string with characters needing encoding
    When the user submits the input
    Then the input should be properly encoded for display
    And no script execution should occur

  Scenario: Input submission failing the security scan
    Given a user enters an input string that fails security validation
    When the user submits the input
    Then the submission should be rejected
    And a security warning should be displayed to the user indicating high-risk XSS vulnerabilities

  Scenario: Input submission that passes validation but fails security scan
    Given the application checks the submission against high-risk XSS patterns
    And the user submits an input that passes validation but still contains harmful patterns
    When the user submits the input
    Then the submission should be rejected
    And a security warning should be displayed to the user

  Scenario Outline: Scenario Outline: XSS Vulnerability Detection
    Given the application checks the submission against high-risk XSS patterns <pattern>
    When the user submits an input containing <input>
    Then if the input matches the pattern, the submission should be rejected
    And a security warning should be displayed to the user
    Examples:
      | pattern | input |
      | <script> | <script>alert('XSS')</script> |
      | <iframe> | <iframe src='malicious-site.com'></iframe> |
      | <img onerror> | <img src='invalid' onerror='alert(1)'> |

