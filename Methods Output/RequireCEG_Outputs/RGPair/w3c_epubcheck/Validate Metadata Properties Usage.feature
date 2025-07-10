Feature: Validate Metadata Properties Usage

  As a document publisher
  I want to ensure that my metadata is compliant with EPUB standards
  So that my document is correctly formatted and can be published without issues

  Background:
    Given a document containing metadata properties
    And the document is prepared for EPUB validation

  Scenario: Scenario 1: Missing dc:type property
    Given the metadata does not contain the 'dc:type' property
    When the system checks the metadata
    Then an error message should be generated indicating that 'dc:type' is required

  Scenario: Scenario 2: Invalid dc:type value
    Given the metadata contains 'dc:type' with an invalid value
    When the system validates the value of 'dc:type'
    Then an error message should be displayed indicating the accepted document types

  Scenario: Scenario 3: Deprecated attributes in meta tag
    Given the metadata includes deprecated attributes
    When the system examines the 'meta' tag
    Then a warning message should be issued regarding the use of deprecated attributes

  Scenario: Scenario 4: Malformed identifiers
    Given the metadata includes malformed identifiers
    When the system validates the identifiers
    Then an error should be flagged specifying the formatting issues

  Scenario: Scenario 5: Missing mandatory metadata properties
    Given the metadata does not contain the title or author property
    When the system checks for mandatory properties
    Then a warning should be issued stating 'Title and Author are required metadata properties but are missing'

  Scenario: Scenario 6: Incorrect property datatypes
    Given the metadata properties use incorrect datatypes
    When the system verifies the datatype of each property
    Then feedback should be provided detailing the expected datatype

  Scenario: Scenario 7: Missing title or author property
    Given the mandatory metadata property 'title' is missing or incorrectly formatted
    And the mandatory metadata property 'author' is missing or incorrectly formatted
    When the system checks for mandatory properties
    Then a warning should be issued stating that 'Title and Author are required metadata properties but are missing'

  Scenario Outline: Scenario Outline: Validate compliance with EPUB standards
    Given the document is prepared with '<property>'
    And the metadata specifies <value> for <type>
    When the validation process occurs
    Then output should indicate compliance status for <property>
    Examples:
      | property | value | type |
      | dc:type | dictionary | valid |
      | title |  | missing |
      | author | John Doe | valid |
      | identifier | inv@lid-id | malformed |

