Feature: Report Improper Attributes

  As a user of the EPUBCheck tool
  I want to analyze EPUB documents for non-compliant attributes
  So that I can ensure the document meets the specified media types and standards

  Background:
    Given that I have an EPUB document to validate
    And the EPUBCheck tool is set up and ready for analysis

  Scenario: Scenario 1: Identify Non-Conforming Attributes
    Given the EPUB document contains attributes that do not conform to specified media types
    When the EPUBCheck tool analyzes the attributes
    Then it should report any improper attributes
    And provide a clear error message indicating the non-compliant attributes

  Scenario: Scenario 2: Warn About Deprecated Attributes
    Given the EPUB document contains deprecated attributes based on EPUB 3.2 or earlier specifications
    When the EPUBCheck tool runs validation
    Then it should generate a warning message about the outdated attributes

  Scenario: Scenario 3: Classify Critical Errors for Accessibility Attributes
    Given the EPUB document has attributes that are incompatible with required usage in media overlays or accessibility features
    When the EPUBCheck tool performs validation
    Then it should classify these as critical errors
    And prompt a severe alert that mandates resolution

  Scenario: Scenario 4: Provide Feedback on Valid Attributes
    Given the EPUB document contains valid attributes that do not align with conventions for dictionaries or glossaries
    When the EPUBCheck tool validates these attributes
    Then it should provide detailed feedback suggesting specific modifications

  Scenario Outline: Scenario Outline: Analyze Attributes for Compliance
    Given the EPUB document contains attributes that need to be analyzed
    And the attributes belong to <context>
    When the EPUBCheck tool checks <number> attributes
    Then provide feedback on <outcome>
    Examples:
      | context | number | outcome |
      | media types | 5 | attributes are non-compliant |
      | accessibility | 3 | attributes require updates |
      | dictionaries | 4 | suggest modifications for compliance |

