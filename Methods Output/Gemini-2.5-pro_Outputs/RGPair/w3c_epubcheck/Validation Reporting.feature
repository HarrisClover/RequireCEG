Feature: Validation Reporting
  As an EPUB Creator
  I want EPUBCheck to provide clear and detailed reports on validation results
  So that I can easily identify and fix errors or warnings in my EPUB.

  Scenario: Report errors found during validation
    Given an EPUB file containing validation errors (e.g., missing required elements, invalid attributes)
    When EPUBCheck completes the validation process
    Then the validation report should list all detected errors
    And each error entry should include details like severity (Error), location (file and line number, if applicable), and a descriptive message

  Scenario: Report warnings found during validation
    Given an EPUB file containing issues classified as warnings (e.g., use of deprecated features, best practice suggestions)
    When EPUBCheck completes the validation process
    Then the validation report should list all detected warnings
    And each warning entry should include details like severity (Warning), location (file and line number, if applicable), and a descriptive message

  Scenario: Report usage information
    Given an EPUB file that uses specific features or follows certain conventions that EPUBCheck tracks
    When EPUBCheck completes the validation process
    Then the validation report may include usage information entries
    And each usage entry should include details like severity (Usage/Info), location (if applicable), and a descriptive message

  Scenario: Report successful validation for a compliant file
    Given a fully compliant EPUB file with no errors or warnings according to the selected specification and profile
    When EPUBCheck completes the validation process
    Then the validation report should indicate that the EPUB is valid
    And the report should explicitly state that no errors or warnings were found