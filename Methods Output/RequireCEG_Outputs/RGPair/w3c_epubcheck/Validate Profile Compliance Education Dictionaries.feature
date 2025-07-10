Feature: Validate Profile Compliance (Education, Dictionaries)

  As a document validator
  I want to ensure EPUB documents adhere to specified profiles
  So that users can maintain compliance with education and dictionary standards

  Background:
    Given that the EPUB document is submitted for validation
    And the profiles are defined with required elements and specifications

  Scenario: Scenario 1: Validate Education Profile
    Given the document contains 'dc:title', 'dc:creator', and 'dc:subject'
    When the system checks for the presence and formatting of required elements
    Then if any required elements are missing or incorrectly formatted, the system triggers an error message
    And the error message details the specific missing or misconfigured elements

  Scenario: Scenario 2: Validate Dictionaries Profile
    Given the document includes the 'dc:type' identifier
    When the system verifies definitions for proper structure and property values
    Then if any definitions are improperly structured or missing, a warning is generated detailing the specific issues

  Scenario: Scenario 3: Validate Compliance for Missing 'dc:title', 'dc:creator', or 'dc:subject'
    Given the document is missing 'dc:title', 'dc:creator', or 'dc:subject'
    When the system evaluates the required elements for the Education profile
    Then the system triggers an error message for missing or misconfigured elements that include 'dc:title', 'dc:creator', or 'dc:subject'

  Scenario: Scenario 4: Validate Missing 'dc:type' Identifier
    Given the document does not include 'dc:type' identifier
    When the system checks for the presence of 'dc:type'
    Then the system triggers an error message indicating that the 'dc:type' identifier is required for the Dictionaries profile

  Scenario Outline: Scenario Outline: Validate Non-conforming URLs
    Given the document contains URLs that may not conform to the profile
    And the system identifies <profile> profile indications
    When the system checks each URL for compliance
    Then if non-conforming URLs are detected, they are flagged for correction
    Examples:
      | profile | URL |
      | Education | http://example.com/missing |
      | Dictionaries | http://example.com/incorrect |

