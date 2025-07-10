Feature: Check for Required Identifiers (e.g., 'dc:type')

  As a system validating EPUB documents
  I want to ensure that the 'dc:type' identifier is present and valid in the metadata
  So that I can provide accurate feedback on the document's compliance with EPUB specifications

  Background:
    Given the EPUB document is uploaded for validation
    And the system is ready to check the metadata

  Scenario: Missing 'dc:type' identifier
    Given the metadata does not include 'dc:type'
    Then an error message should be generated
    And the message should state 'Error: The required identifier dc:type is missing from the metadata.'

  Scenario: Invalid value for 'dc:type'
    Given the metadata contains 'dc:type' with an invalid value
    Then a warning message should be issued
    And the message should state 'Warning: The value of dc:type is invalid. Valid options are: book, journal, dictionary, glossary.'

  Scenario: Valid 'dc:type' identifier
    Given the metadata includes 'dc:type' with a valid value
    When the system checks if the value aligns with the expected document type
    Then the system should proceed to validate other required identifiers

  Scenario: Valid 'dc:type' but not aligning with expected document type
    Given the metadata includes 'dc:type' as 'book'
    And the document type is 'dictionary'
    When the system checks for alignment between 'dc:type' and document type
    Then the system should issue a warning
    And the message should state 'Flag a warning for inconsistencies between 'dc:type' and document type.'

  Scenario Outline: Check 'dc:type' for Dictionary or Glossary
    Given the metadata includes 'dc:type' as <dc-type>
    And the document type is <document-type>
    When the system checks for alignment between 'dc:type' and document type
    Then the system should ensure the relationship is valid
    And any inconsistencies should issue a warning
    Examples:
      | dc-type | document-type |
      | dictionary | dictionary |
      | glossary | glossary |
      | book | dictionary |
      | journal | glossary |

