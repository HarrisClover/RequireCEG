Feature: Report Non-Conforming URLs

  As a content creator
  I want to validate URLs in a content document
  So that I can ensure compliance with EPUB specifications

  Background:
    Given the content document contains multiple URLs
    And the validation tool is ready to check the URLs

  Scenario: Scenario 1: Single Non-Conforming URL
    Given a URL fails to meet the expected format
    When the validation tool checks the content document
    Then an error is reported
    And the nature of the issue is specified

  Scenario: Scenario 2: Multiple Non-Conforming URLs
    Given multiple URLs are non-conforming
    When the validation tool generates a report
    Then each URL is individually reported
    And clear messaging is provided for discrepancies

  Scenario: Scenario 3: Missing Required URL Identifier
    Given a required URL identifier is not present
    When the validation tool checks the document
    Then an error is highlighted for the missing identifier

  Scenario: Scenario 4: Invalid Remote Resource
    Given a URL points to an invalid remote resource
    When the validation tool accesses the URL
    Then an error report is generated indicating the inaccessibility

  Scenario: Scenario 5: Deprecated URL
    Given a URL is found to be deprecated
    When the validation tool checks the document
    Then a warning is raised
    And the user is alerted of potential compliance issues

  Scenario: Scenario 6: URL Validations Combined
    Given a URL fails to meet the expected format
    And a required URL identifier is not present
    When the validation tool checks the document
    Then an error is reported for the non-conforming URL
    And an error is highlighted for the missing URL identifier

  Scenario: Scenario 7: Valid Remote Resource
    Given a URL points to a valid remote resource
    When the validation tool accesses the URL
    Then no errors are reported

  Scenario Outline: Scenario Outline: URL Validation
    Given the content document contains <number> URLs
    And the URLs are of <type> type
    When the system runs the validation check
    Then the report indicates <result>
    Examples:
      | number | type | result |
      | 1 | invalid | error |
      | 3 | valid | no errors |
      | 2 | deprecated | warning |

