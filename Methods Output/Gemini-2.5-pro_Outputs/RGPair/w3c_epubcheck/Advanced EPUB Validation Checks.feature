Feature: Advanced EPUB Validation Checks
  As an EPUB Creator
  I want EPUBCheck to perform advanced checks like handling remote resources, verifying media types, and warning about deprecated elements
  So that my EPUB is robust, future-proof, and technically sound.

  Scenario: Check media type consistency
    Given an EPUB manifest item declaring a specific media type (e.g., 'image/jpeg')
    And the linked resource file has a different actual format (e.g., it's a PNG file)
    When EPUBCheck validates the package (and potentially inspects the resource)
    Then an error or warning about the mismatched declared vs. actual media type should be reported

  Scenario: Handle validation involving remote resources
    Given an EPUB package that includes references to remote resources (e.g., external CSS or JavaScript)
    When EPUBCheck validates the package
    Then checks related to the validity or accessibility of these remote resource references should be performed (details may depend on EPUBCheck configuration/capabilities)
    And potential issues (e.g., invalid URL format) should be reported

  Scenario: Report usage of deprecated elements or attributes
    Given an EPUB Content Document using a deprecated element (e.g., '<font>') or attribute
    When EPUBCheck validates the document
    Then a warning indicating the usage of a deprecated element/attribute should be reported