Feature: Report Missing or Duplicate Identifiers

  As a document processor
  I want to validate EPUB documents for identifiers
  So that I can ensure the integrity of the document by checking for required identifiers

  Background:
    Given a system that processes EPUB documents
    And identifiers should conform to specific requirements

  Scenario: Missing dc:id Identifier
    Given an EPUB document without a 'dc:id' identifier in the Package Document
    When the document is processed
    Then a critical error message is generated
    And it indicates that the 'dc:id' identifier is required and must be present

  Scenario: Duplicate Identifier Warning
    Given an EPUB document with duplicate identifiers
    When the document is processed
    Then a warning message is generated
    And it details the specific identifier and its location within the document

  Scenario: Duplicate Identifier Error Handling
    Given an EPUB document where multiple identifiers share the same value
    When the document is processed
    Then the system classifies this scenario as a duplicate identifier error
    And it provides detailed instructions to resolve the issue

  Scenario: Missing and Duplicate Identifiers
    Given an EPUB document missing the 'dc:id' identifier and having duplicate identifiers
    When the document is processed
    Then the system prioritizes reporting the missing 'dc:id' identifier first
    And then provides a warning for the duplicate identifiers

  Scenario: Missing 'dc:id' and Duplicate Identifiers
    Given an EPUB document with both a missing 'dc:id' and duplicate identifiers
    When the document is processed
    Then the system generates a critical error message for the missing 'dc:id' identifier first
    And follows with a warning message detailing the duplicate identifiers
