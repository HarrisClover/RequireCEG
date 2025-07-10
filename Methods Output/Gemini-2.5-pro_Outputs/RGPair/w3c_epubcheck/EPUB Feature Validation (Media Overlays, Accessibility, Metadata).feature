Feature: EPUB Feature Validation (Media Overlays, Accessibility, Metadata)
  As an EPUB Creator using advanced features
  I want EPUBCheck to validate the correct implementation of Media Overlays, Accessibility features, and Metadata
  So that these features function correctly and meet standards.

  Scenario: Validate correctly structured Media Overlays
    Given an EPUB containing correctly structured Media Overlay documents linked from the Package Document
    When EPUBCheck validates the EPUB package
    Then no errors related to Media Overlay structure or linking should be reported

  Scenario: Detect errors in Media Overlay references
    Given an EPUB containing a Media Overlay document that references non-existent elements or audio files
    When EPUBCheck validates the EPUB package
    Then errors detailing the invalid Media Overlay references should be reported

  Scenario: Validate presence and structure of Accessibility metadata
    Given an EPUB package declaring specific accessibility features in its metadata (e.g., schema.org accessibility properties)
    When EPUBCheck validates the package
    Then the presence and structural validity of the declared accessibility metadata should be checked
    And any errors in the accessibility metadata structure should be reported

  Scenario: Validate core metadata properties
    Given an EPUB package document
    When EPUBCheck validates the package
    Then the validity and correct usage of core metadata properties (like dc:identifier, dc:title, dc:language) should be confirmed
    And errors related to missing required metadata or incorrect usage should be reported