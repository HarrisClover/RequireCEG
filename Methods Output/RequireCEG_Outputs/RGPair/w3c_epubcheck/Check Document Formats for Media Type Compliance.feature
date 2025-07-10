Feature: Check Document Formats for Media Type Compliance

  As a system validator
  I want to ensure that EPUB documents comply with specified versions and standards
  So that I can provide accurate validation reports for better usability across various platforms

  Background:
    Given the document format is identified
    And the document needs to meet specific compliance requirements

  Scenario: Scenario 1: Validate EPUB 3.2 Compliance
    Given the document format is EPUB 3.2
    And the document contains specified media types and structural elements
    When the system validates the document
    Then the document should adhere to the EPUB 3.2 specifications
    And any issues should be reported accordingly

  Scenario: Scenario 2: Validate Legacy EPUB Compliance
    Given the document format is an earlier version of EPUB
    When the system checks for compliance with legacy specifications
    Then any issues found should be reported

  Scenario: Scenario 3: Validate EPUB for Education Properties
    Given the document is tagged for EPUB for Education
    When the system confirms required educational-specific properties and elements
    Then the system should ensure all required properties are present

  Scenario: Scenario 4: Validate EPUB Dictionary Metadata
    Given the document is identified as an EPUB Dictionary
    When the system checks for required metadata properties
    Then an error message should be raised if 'dc:type' is missing

  Scenario: Scenario 5: Check for Valid Remote Resource URLs
    Given the document contains remote resources
    And the resource URLs are validated
    When the system checks the resource URLs for validity
    Then a warning message should be generated for any invalid URLs

  Scenario: Scenario 6: Check for Deprecated Attributes or Elements
    Given the document contains deprecated attributes or elements
    When the system inspects the document
    Then a warning should be raised indicating updates are needed

  Scenario Outline: Scenario Outline: Check Remote Resource URLs
    Given the document contains remote resources
    And the resource URLs are to be validated
    When the system checks the resource URLs for validity
    Then a warning message should be generated for any invalid URLs
    Examples:
      | URL | Media Type | Validity |
      | http://valid.url/resource.png | image/png | Valid |
      | http://invalid.url/resource.png | image/png | Invalid |

