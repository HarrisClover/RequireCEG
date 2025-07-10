Feature: Categorize Errors and Warnings

  As a document validator
  I want to categorize validation issues found in EPUB documents
  So that users can easily understand and resolve compliance problems

  Background:
    Given the EPUB document is uploaded for validation
    And the validation criteria are set according to EPUB standards

  Scenario: Missing Required Elements
    Given the validation identifies missing required elements
    When the check for critical errors is performed
    Then a 'Critical Error' message is generated
    And the message details the missing elements

  Scenario: Deprecated Attributes Found
    Given the validation process detects deprecated attributes
    When the analysis of attributes is conducted
    Then a 'Warning' is issued
    And the warning highlights the outdated attributes

  Scenario: Invalid URL Format
    Given the document contains URLs that do not conform to expected formats
    When the URL validation is executed
    Then an 'Error' categorization is triggered
    And specific feedback on compliance failures is provided

  Scenario: Incorrect Data Types
    Given valid identifiers are found but associated with incorrect data types
    When the data type validation occurs
    Then an 'Error' is flagged
    And clear guidance on the nature of the data type issues is provided

  Scenario: No Issues Found
    Given the document confirms accurate usage of media overlays and accessibility features
    When the overall compliance check is performed
    Then the document status is categorized as 'No Issues Found'

  Scenario: Minor Validation Check Failures
    Given the document meets guidelines of the EPUB for Education profile but fails minor checks
    When the minor validation checks are executed
    Then a 'Minor Warning' is issued
    And details of the minor infringements are provided

  Scenario: Improper Attributes Found
    Given the validation process detects improper attributes
    When the analysis of attributes is conducted
    Then an 'Error' categorization is triggered
    And clear guidance on incorrect attributes is provided

  Scenario: Valid Identifiers with Incorrect Data Types
    Given the validation process finds valid identifiers with incorrect data types
    When the data type validation is executed
    Then an 'Error' message is generated
    And the message provides clear guidance on the correct types

  Scenario: URL Non-conformance Identify
    Given the document has URLs that do not conform to the expected format
    When the URL validation runs
    Then an 'Error' message is issued
    And the feedback highlights the specific URLs causing the issue
