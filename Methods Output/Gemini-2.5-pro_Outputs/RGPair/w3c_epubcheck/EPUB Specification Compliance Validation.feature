Feature: EPUB Specification Compliance Validation
  As an EPUB Creator
  I want EPUBCheck to validate my EPUB against standard specifications (e.g., EPUB 3.2 and earlier)
  So that I can ensure my publication meets baseline technical requirements.

  Scenario: Validate a compliant EPUB 3.2 Package Document
    Given a valid EPUB 3.2 Package Document
    When EPUBCheck validates the document against the EPUB 3.2 specification
    Then no package document structure or syntax errors should be reported

  Scenario Outline: Validate presence of required elements in Package Document
    Given an EPUB Package Document missing the required element "<element>"
    When EPUBCheck validates the document
    Then an error indicating the missing required element "<element>" should be reported

    Examples:
      | element      |
      | metadata     |
      | manifest     |
      | spine        |
      | package      | # Root element itself
      | dc:identifier| # Example required metadata
      | dc:title     | # Example required metadata
      | dc:language  | # Example required metadata

  Scenario Outline: Validate data types in Content Documents
    Given an EPUB Content Document (e.g., XHTML) containing an attribute "<attribute>" with an invalid data type "<invalid_value>"
    When EPUBCheck validates the content document
    Then an error regarding the invalid data type for attribute "<attribute>" should be reported

    Examples:
      | attribute   | invalid_value |
      | width       | "abc"         | # Expecting number/percentage
      | colspan     | "zero"        | # Expecting integer
      | datetime    | "yesterday"   | # Expecting specific format

  Scenario: Validate structure rules in Navigation Document
    Given an EPUB Navigation Document that violates a required structure rule (e.g., incorrect nesting of 'nav' elements)
    When EPUBCheck validates the Navigation Document
    Then an error detailing the structure rule violation should be reported

  Scenario: Detect duplicate identifiers within the EPUB package
    Given an EPUB package containing duplicate identifiers (e.g., two manifest items with the same ID)
    When EPUBCheck validates the package
    Then an error reporting the duplicate identifier should be generated

  Scenario: Detect non-conforming URLs
    Given an EPUB manifest containing an item with a non-conforming URL (e.g., containing invalid characters)
    When EPUBCheck validates the package
    Then an error regarding the non-conforming URL should be reported

  Scenario: Detect improper attributes in Content Documents
    Given an EPUB Content Document using an attribute not allowed on a specific element (e.g., 'href' on a 'p' tag)
    When EPUBCheck validates the content document
    Then an error reporting the improper attribute usage should be generated

  Scenario: Validate against a legacy specification
    Given a valid EPUB 2.0.1 package
    When EPUBCheck validates the package against the EPUB 2.0.1 specification
    Then no specification compliance errors for EPUB 2.0.1 should be reported