Feature: Report Media Type Errors

  As a user of the EPUBCheck tool
  I want to ensure media types comply with the predefined standards
  So that I can avoid issues related to media type errors and ensure document compatibility

  Background:
    Given the predefined list of valid media types is available
    And a media type is specified in the Package Document

  Scenario: Invalid Media Type Detected
    Given the media type 'invalid/type' is declared
    When EPUBCheck tool processes the Package Document
    Then an error should be reported
    And the message should detail the invalid media type

  Scenario: Duplicate Media Type Error
    Given multiple media types 'image/png' and 'image/jpeg' are declared for a single resource
    When EPUBCheck tool processes the Package Document
    Then a Duplicate Media Type Error should be flagged
    And it should indicate the specific resource involved

  Scenario: Deprecated Media Type Warning
    Given the media type 'audio/mpeg' is declared
    When EPUBCheck tool identifies it as deprecated
    Then a warning should be generated
    And the user should be urged to update the media type

  Scenario: Inconsistent Media Type Error
    Given the media type 'text/html' declared in the Package Document
    And the Content Document is actually 'application/xhtml+xml'
    When EPUBCheck tool processes the document
    Then an Inconsistency Error should be reported
    And the message should clarify the mismatch

  Scenario: Unsupported Remote Resource Media Type Warning
    Given a remote resource is referenced with media type 'application/x-unknown'
    When EPUBCheck tool processes the reference
    Then a warning should be issued
    And the user should be advised to verify support for that media type

  Scenario: Media Type Consistency Check
    Given the media type 'image/gif' is declared in the Package Document
    And the Content Document also declares 'image/gif'
    When EPUBCheck tool processes the document
    Then no error should be reported
    And the media type should be consistent throughout
