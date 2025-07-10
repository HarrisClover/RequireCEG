Feature: EPUB Validation Process

  As a EPUB validator
  I want to ensure the integrity and compliance of EPUB files
  So that users can create EPUBs that meet all necessary standards

  Background:
    Given a valid EPUB package document is provided
    And the validation system is online

  Scenario: Scenario 1: Missing Identifiers
    Given the package document does not include 'identifier'
    When the system validates the document
    Then an error indicating the missing identifier should be reported

  Scenario: Scenario 2: Invalid URLs
    Given the package contains URLs
    When the system checks each URL's validity
    Then an error message should show any invalid URLs

  Scenario: Scenario 3: Accessibility Features Validation
    Given the EPUB includes media overlays
    When the system validates the usage of overlays and accessibility features
    Then a warning should be issued for any missing or incorrectly implemented features

  Scenario: Scenario 4: Absence of 'dc:type'
    Given the package document does not include 'dc:type'
    When the system validates the document
    Then an error should be raised for the absence of 'dc:type' in dictionaries or glossaries

  Scenario: Scenario 5: Discrepancies During Validation
    Given the validation process is in effect
    When discrepancies are identified
    Then a detailed feedback report outlining errors, warnings, and recommendations should be generated

  Scenario Outline: Scenario Outline: Comprehensive Validation
    Given the package document is validated for required elements <missing-elements>
    And the system checks accessibility features <accessibility-status>
    When the system verifies remote resources <remote-resources-status>
    Then the system should report discrepancies <discrepancy-status>
    Examples:
      | missing-elements | accessibility-status | remote-resources-status | discrepancy-status |
      | identifier | missing | valid | error |
      | dc:type | present | mismatch | warning |
      | identifier, dc:type | missing | invalid | error |

