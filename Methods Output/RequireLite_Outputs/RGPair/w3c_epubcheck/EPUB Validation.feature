Feature: EPUB Validation

  As an EPUB publisher
  I want to validate EPUB files against standard specifications and profiles
  So that I can ensure the publications are compliant and usable across platforms

  Background:
    Given that the EPUBCheck tool is initialized
    And it is configured to check for EPUB 3.2 and earlier versions

  Scenario: Check Compliance with EPUB 3.2
    Given an EPUB file submitted for validation
    When the EPUBCheck tool runs compliance checks
    Then the tool should validate Package Documents, Content Documents, and Navigation Documents
    And it should report any required elements that are missing

  Scenario: Report Invalid Media Types
    Given an EPUB file contains media elements
    When checking media types in the EPUB file
    Then the tool should report any invalid media types

  Scenario Outline: Validate Document Properties
    Given the EPUBCheck tool verifies metadata properties for <identifier>
    When validating the properties within the document
    Then the tool should confirm proper usage of <property>
    And it ensures compliance for <media-type> documents
    Examples:
      | identifier | media-type | property |
      | dc:type | dictionaries | correct utilization |
      | dc:type | glossaries | proper implementation |
      | dc:title | content | valid title structure |
      | dc:creator | metadata | identified author |


  Scenario: Report Error Messages from EPUBCheck
    Given an EPUB file with compliance issues
    When the EPUBCheck tool runs
    Then the tool should report error messages detailing compliance failures
