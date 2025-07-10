Feature: Identify Deprecated Elements

  As a content publisher
  I want to ensure my EPUB documents are free from deprecated elements and attributes
  So that I can maintain compliance and ensure the longevity of my documents

  Background:
    Given the system is equipped with the EPUBCheck tool
    And the document is a valid EPUB format

  Scenario: Scenario 1: Detecting a single deprecated element
    Given an EPUB document containing a deprecated element
    When the document is processed with EPUBCheck
    Then a warning message should be generated specifying the deprecated element's name
    And the location of the deprecated element should be indicated

  Scenario: Scenario 2: Detecting multiple deprecated elements
    Given an EPUB document containing multiple deprecated elements
    When the document is processed with EPUBCheck
    Then a consolidated message should summarize the total counts of deprecated elements
    And specific details of each deprecated instance should be provided

  Scenario: Scenario 3: Identifying deprecated attributes with guidance for replacements and alternatives
    Given an EPUB document that contains deprecated attributes
    When the document is processed with EPUBCheck
    Then the system shall provide clear guidance on recommended replacements
    And users will receive actionable steps to achieve compliance

  Scenario Outline: Scenario Outline: Compliance risk due to deprecated elements
    Given the document includes a required set of elements with deprecated instances
    And the EPUBCheck tool checks for compliance risks
    When the document is processed
    Then a compliance risk warning should be triggered
    Examples:
      | Element | Location | Compliance Risk |
      | Element1 | Line 5, Char 10 | High |
      | Element2 | Line 12, Char 3 | Medium |
      | Element3 | Line 20, Char 1 | High |

