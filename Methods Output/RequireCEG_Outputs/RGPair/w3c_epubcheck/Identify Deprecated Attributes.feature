Feature: Identify Deprecated Attributes

  As a developer or content creator
  I want to analyze EPUB publications for deprecated attributes
  So that I can ensure compliance with the latest EPUB specifications and improve the quality of the publication

  Background:
    Given the EPUB publication is loaded
    And the analysis tools are ready to use

  Scenario: Scenario 1: Identify deprecated attributes in Package Document
    Given the Package Document contains deprecated attributes
    When the EPUBCheck tool analyzes the Package Document
    Then a warning should be printed for each deprecated attribute
    And a suggestion for its current alternative should be included in the warning

  Scenario: Scenario 2: Identify deprecated attributes in Content Documents
    Given the Content Document has deprecated attributes
    When the EPUBCheck tool analyzes the Content Document
    Then a detailed warning should identify the exact element containing the deprecated attribute

  Scenario: Scenario 3: Summary report of deprecated attributes
    Given multiple deprecated attributes are found
    When the analysis completes
    Then a summary report should be generated that lists each deprecated element for the user

  Scenario: Scenario 4: Compliance with legacy specifications
    Given deprecated attributes are detected but the publication is compliant with a legacy specification
    When the EPUBCheck tool processes the publication
    Then the tool should indicate exceptions for legacy compliance while issuing related warnings

  Scenario: Scenario 5: No deprecated attributes found
    Given the EPUB publication contains no deprecated attributes
    When the EPUBCheck tool performs its analysis
    Then the user should be notified that all attributes comply with the current EPUB specifications

  Scenario: Scenario 6: Summary report compilation of deprecated attributes
    Given the Package Document contains deprecated attributes and the Content Document has deprecated attributes
    When the EPUBCheck tool analyzes both documents
    Then a summary report should be generated that distinctly lists each deprecated element
