Feature: Validate Properties Conformance

  As a developer
  I want to validate EPUB file structure and content
  So that I can ensure compliance with the EPUB specifications

  Background:
    Given the EPUB file version is 3.2
    And the system is ready to validate the uploaded file

  Scenario: Validate Package Document
    Given the Package Document is checked for required elements
    When any required elements are missing
    Then the system generates an error message listing the absent elements

  Scenario: Check for Duplicate Identifiers
    Given the identifiers in the EPUB file are reviewed
    When any identifiers are missing or duplicated
    Then the system flags an error with a description of the required identifiers

  Scenario: Validate URLs Format
    Given the URLs in the document are validated
    When a URL does not conform to the specified format
    Then the system issues a warning detailing the invalid URL

  Scenario: Check Media Overlays Implementation
    Given media overlays are reviewed for correctness
    When incorrect structure or missing features are found
    Then the system prompts an error message outlining the issues

  Scenario: Validate Accessibility Features
    Given the EPUB file is checked for accessibility features
    When accessibility features such as 'aria-labels' are missing
    Then the system raises a warning to encourage adherence to best practices

  Scenario: Detect Deprecated Attributes
    Given the EPUB file is validated for deprecated attributes
    When deprecated attributes are found
    Then the system triggers a warning but continues validation

  Scenario: Check Dictionaries and Glossaries Identifiers
    Given dictionaries or glossaries are validated
    When mandatory identifiers such as 'dc:type' are absent
    Then the system reports an error specifying the missing identifiers

  Scenario: Validate Remote Resources
    Given remote resources are detected in the EPUB file
    When the media types of these resources are validated
    Then the system ensures they correspond accurately to the specified media types

  Scenario: Validate Content Documents
    Given the Content Documents are checked for required elements
    When any required elements are missing
    Then the system generates an error message listing the absent elements
