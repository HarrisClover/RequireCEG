Feature: Check for Required Elements

  As a document validator
  I want to ensure proper structure and required metadata in documents
  So that I can provide accurate error and warning messages for compliance

  Background:
    Given a Package Document is submitted for validation
    And the system needs to check for required elements

  Scenario: Scenario 1: Validate Package Document for Missing Metadata
    Given the Package Document is missing the 'metadata' element
    Then an error message is displayed: 'Error: Missing element - metadata'

  Scenario: Scenario 2: Validate Content Document for Missing Name Attribute
    Given the Content Document is missing the 'name' attribute
    Then a warning is issued: 'Warning: Non-conforming structure - missing name attribute in Content Document'

  Scenario: Scenario 3: Validate Navigation Document for Missing Nav Element
    Given the Navigation Document is missing the 'nav' element
    Then an error message is shown: 'Error: Missing element - nav'

  Scenario: Scenario 4: Check for Duplicate Identifiers Across Documents
    Given duplicate identifiers exist across the documents
    Then an error is raised with the message: 'Error: Duplicate identifiers found - [list_of_identifiers]'

  Scenario: Scenario 5: Check for Missing dc:type Metadata
    Given dictionaries or glossaries lack 'dc:type' metadata
    Then a warning is issued: 'Warning: Missing dc:type metadata for dictionaries or glossaries - ensure compliance with EPUB specifications'

  Scenario: Scenario 6: Check for Deprecated Elements Used in Documents
    Given documents conform to EPUB 3.2 or earlier versions and use deprecated elements or attributes
    Then a warning is generated for each instance: 'Warning: Deprecated element/attribute used - [element/attribute_name]'

  Scenario: Scenario 7: Validate Remote Resource Media Types Compliance
    Given remote resources are utilized with non-compliance to predefined media types
    Then an error message details discrepancies: 'Error: Remote resource media type non-compliance - [list_of_discrepancies]'

  Scenario: Scenario 8: Validate No Missing Elements Scenario
    Given the Package Document includes all required elements
    Then no error message is displayed

  Scenario: Scenario 9: Validate Inclusion of IRS Metadata
    Given the Package Document has valid identifiers
    Then a warning is not issued regarding invalid identifiers

  Scenario: Scenario 10: Validate Non-Deprecation of Elements
    Given documents are conforming to a recent version and do not use deprecated elements or attributes
    Then no warning is generated for deprecated instances
