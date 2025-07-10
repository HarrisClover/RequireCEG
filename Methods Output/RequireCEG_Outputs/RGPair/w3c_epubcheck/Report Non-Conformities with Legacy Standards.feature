Feature: Report Non-Conformities with Legacy Standards

  As a document compliance analyst
  I want to analyze documents for compliance with EPUB standards
  So that I can ensure the documents meet both current and legacy specifications

  Background:
    Given the document under review contains various elements and attributes
    And the current and legacy EPUB standards are defined

  Scenario: Successful Compliance Check with Current and Legacy Standards
    Given the document contains valid elements from both current and legacy standards
    When the analysis is performed
    Then the document passes validation
    And no non-conformities are reported

  Scenario: Warning for Deprecated Attributes in Document
    Given the document contains deprecated attributes from legacy standards
    When the analysis is performed
    Then a warning message is generated indicating deprecated attributes
    And the report specifies which legacy elements may still be present

  Scenario: Detailed Feedback for Non-Compliant Legacy Elements
    Given the document includes non-compliant legacy elements
    And it fails to meet some legacy specifications
    When the document analysis is conducted
    Then the report provides detailed feedback on specific attributes or elements that are non-compliant

  Scenario: Reporting Non-Conformities for Legacy Specifications
    Given the document includes non-compliant legacy elements
    And it fails to meet some legacy specifications
    When the document analysis is performed
    Then the report categorizes legacy-only elements or attributes as non-conformities
