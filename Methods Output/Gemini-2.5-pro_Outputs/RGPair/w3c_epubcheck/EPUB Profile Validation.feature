Feature: EPUB Profile Validation
  As an EPUB Creator developing a specialized EPUB
  I want EPUBCheck to validate compliance against specific EPUB profiles (e.g., Education, Dictionary)
  So that my EPUB meets the requirements for its intended use case.

  Scenario: Validate against EPUB for Education profile
    Given an EPUB intended for the Education profile containing profile-specific features
    When EPUBCheck validates the EPUB against the Education profile
    Then checks specific to the Education profile requirements should be performed
    And any violations of the Education profile rules should be reported as errors

  Scenario: Validate Dictionary profile requirements (dc:type)
    Given an EPUB intended as a Dictionary/Glossary
    And the package metadata is missing the required 'dc:type' property with value 'dictionary' or 'glossary'
    When EPUBCheck validates the EPUB against the Dictionary profile
    Then an error indicating the missing or incorrect 'dc:type' metadata should be reported

  Scenario: Validate a compliant Dictionary EPUB
    Given an EPUB intended as a Dictionary/Glossary
    And the package metadata includes the required 'dc:type' property with value 'dictionary'
    And the EPUB meets other Dictionary profile requirements
    When EPUBCheck validates the EPUB against the Dictionary profile
    Then no Dictionary profile-specific errors should be reported