Feature: Verify Content Types and Fields

  As an administrator
  I want to ensure all required fields for content types are filled out correctly
  So that I can prevent incomplete submissions and maintain data integrity

  Background:
    Given the administrator has the appropriate permissions
    And the content type is being created or edited

  Scenario: Scenario 1: Missing Required Fields
    Given the required fields such as name and contact details are not filled
    When the administrator attempts to save the content type
    Then the system displays a warning message indicating which fields are necessary for completion
    And the save action is prevented until all mandatory sections are completed

  Scenario: Scenario 2: Validating Taxonomy Terms
    Given the administrator adds terms from predefined taxonomies
    When the administrator submits the content type
    Then the system validates that the terms adhere to the structured format and criteria

  Scenario: Scenario 3: Testing Interactive Elements
    Given the initialized content type includes interactive buttons and fields
    When the administrator tests the functionality and visibility of these elements
    Then the administrator can confirm their performance before finalizing the content type

  Scenario: Scenario 4: Incomplete Mandatory Sections
    Given any required field is missing
    And the administrator attempts to save the content type without completing all mandatory sections
    When the save action is initiated
    Then the system prevents the save action and presents a prompt requesting completion of all mandatory sections

  Scenario: Scenario 5: Validation of Added Terms
    Given the administrator adds terms that do not adhere to the structured format and criteria
    When the administrator submits the content type
    Then the system validates that the added terms do not meet the required format and criteria
