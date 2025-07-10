Feature: Validate Against Legacy EPUB Specifications

  As a publisher
  I want to ensure my EPUB publication meets legacy specifications
  So that it functions correctly across multiple platforms and avoids validation errors

  Background:
    Given the EPUB publication is prepared for validation
    And the system has access to legacy EPUB validation rules

  Scenario: Scenario 1: Validate Presence of Required Elements
    Given the EPUB publication contains Package, Content, and Navigation documents
    When the EPUBCheck tool validates the documents
    Then the system should report any missing required elements
    And the user should be notified of the validation errors

  Scenario: Scenario 2: Check Data Types and Properties
    Given the EPUB publication has defined data types and properties
    When the validation process assesses these definitions
    Then the system should notify the user of any discrepancies with appropriate error messages

  Scenario: Scenario 3: Detect Deprecated Attributes
    Given the EPUB publication includes deprecated attributes or elements
    When the system identifies these during validation
    Then the tool should issue a warning and provide options to rectify or acknowledge the warnings

  Scenario: Scenario 4: Validate against outdated publication
    Given the EPUB publication is outdated
    When the EPUBCheck tool performs validation
    Then the system should retain legacy validation rules

  Scenario Outline: Scenario Outline: Validate Remote Resources
    Given the EPUB publication contains remote resources
    And the media types are specified
    When the validation process checks media type alignment
    Then the system should ensure compliance with legacy guidelines
    Examples:
      | media-type | resource | expected-compliance |
      | image/jpeg | image1.jpg | compliant |
      | text/html | remoteContent.html | non-compliant |
      | application/pdf | document.pdf | compliant |

