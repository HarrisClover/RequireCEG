Feature: Validate EPUB Version Compliance

  As a digital publisher
  I want to ensure that EPUB files meet the structure and content requirements
  So that I can provide a compliant and error-free reading experience for users

  Background:
    Given the EPUB version is 3.2 or earlier
    And the EPUB document is accessible for validation

  Scenario: Scenario 1: Verify Required Elements in Package Document
    Given the document is parsed
    When the required elements are checked for inclusion
    Then an error message 'Missing required element: metadata' should be generated if the 'metadata' element is missing
    And an error message 'Missing required element: manifest' should be generated if the 'manifest' element is missing
    And an error message 'Missing required element: spine' should be generated if the 'spine' element is missing

  Scenario: Scenario 2: Check 'dc:type' Identifier for Education or Dictionaries
    Given the EPUB version is for Education or Dictionaries
    When the 'dc:type' identifier is validated
    Then an error message 'Invalid or missing dc:type' shall be issued if the value is invalid or missing

  Scenario: Scenario 3: Flag Deprecated Attributes
    Given the EPUB document is analyzed
    When deprecated attributes are identified
    Then a warning message 'Deprecated attribute: {attribute name}' should be flagged

  Scenario: Scenario 4: Validate Content Document Structure
    Given the Content Document is processed
    When the structure rules are validated
    Then errors associated with media types and duplicate identifiers in the Content Document shall be reported

  Scenario: Scenario 5: Validate Navigation Document Structure
    Given the Navigation Document is processed
    When the validation rules are applied
    Then errors related to media types and non-conforming URLs in the Navigation Document shall be reported

    Scenario: Compile Comprehensive Error Report
    Given all identified errors and warnings are collected
    When the validation is complete
    Then a comprehensive feedback report should be presented detailing all identified errors and warnings

  Scenario Outline: Scenario Outline: Verify Remote Resources
    Given the document contains remote resources
    And each resource is matched against its media type
    When discrepancies are found
    Then an error message 'Invalid media type for resource: {resource name}' shall be displayed
    Examples:
      | resource name | expected media type | actual media type |
      | image01.jpg | image/jpeg | image/png |
      | audio01.mp3 | audio/mpeg | audio/wav |
      | video01.mp4 | video/mp4 | video/x-matroska |


  Scenario: Scenario 7: Validate Dependency on Required Conditions
    Given the EPUB version is 3.2 or earlier
    And the Package Document is validated
    When the required elements are missing
    Then an error message 'Invalid or missing dc:type' should not appear if 'dc:type' is defined correctly

  Scenario: Scenario 8: Ensure No Deprecated Attributes Exist
    Given the EPUB document is analyzed
    When deprecated attributes are identified
    Then a warning message 'Deprecated attribute: {attribute name}' should not appear if no deprecated attributes are found
