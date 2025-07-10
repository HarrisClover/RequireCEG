Feature: EPUBCheck Tool Validation
  As a user of the EPUBCheck tool,
  I want to validate EPUB documents,
  So that I can ensure compliance with EPUB specifications and other requirements.

Scenario: Validate EPUB Documents for Compliance
  Given that the EPUBCheck tool is set up to validate against EPUB 3.2, earlier versions, and profiles such as EPUB for Education and EPUB Dictionaries
  And the EPUB package documents, content documents, and navigation documents are available for validation
  When the EPUBCheck tool validates the documents
  Then the tool should ensure that the package document contains required elements and correct data types
  And the content documents should have valid properties and proper structure
  And the navigation documents should be correctly formed and contain all required links
  And the tool should check for the presence of valid media types and external resources
  And the tool should identify missing or duplicate identifiers, invalid URLs, and improper attributes
  And the tool should check for the correct implementation of accessibility features and metadata properties
  And the tool should validate that remote resources are properly referenced and valid
  And the tool should report warnings if deprecated attributes or elements are found
  And the tool should provide a detailed report on errors, warnings, or necessary fixes for compliance
