Feature: Check Data Types

  As a content validator
  I want to ensure all elements in the Package Document conform to EPUB specifications
  So that users are guided towards compliance with EPUB standards

  Background:
    Given that required elements in the Package Document are defined
    And that optional elements are correctly specified

  Scenario: Missing Element Error
    Given a required element is absent from the Package Document
    When the system performs validation
    Then a missing element error should be reported
    And the detailed information on the missing element should be provided

  Scenario: Type Mismatch Error
    Given an element designated as a string contains numeric data
    When the system checks data types in the Package Document
    Then a type mismatch error should indicate the specific element causing the issue

  Scenario: Invalid Property Issue
    Given a metadata property in the Content Document has an incorrect data type
    When the system validates the Content Document
    Then an invalid property issue should be reported
    And corrective suggestions should be offered

  Scenario: Type Error in Navigation Document
    Given a media overlay is referenced in the Navigation Document
    When the system validates the reference
    Then a type error should be reported indicating the specific reference issue

  Scenario: Compliance Warning for Optional Elements
    Given optional elements are supplied in the Package Document
    And some optional elements do not conform to expected data types
    When the system validates the Package Document
    Then a warning should be raised suggesting the user correct discrepancies for optional elements

  Scenario: Invalid Metadata Property Highlighting
    Given the Content Document contains a metadata property recapping incorrect data type
    When the system validates the Content Document
    Then the system should highlight invalid metadata property issues

  Scenario: Discrepancy Compliance Report
    Given legacy data types are identified during validation
    And current and legacy specifications must be adhered to
    When the system performs validation
    Then any discrepancies should be reported as compliance issues

  Scenario Outline: Validation of Legacy Data Types
    Given legacy data types are identified during validation
    And current and legacy specifications must be adhered to
    When the system performs validation
    Then any discrepancies should be reported as compliance issues
    Examples:
      | Data Type | Specification | Issue |
      | String | Current | Mismatch with expected format |
      | Integer | Legacy | Compliance issue detected |
      | Boolean | Current | Inconsistent data type found |

