Feature: Provide Warnings for Deprecated Features

  As a user of the EPUB publishing system
  I want the system to analyze my EPUB publication for deprecated attributes or elements
  So that I can address deprecated issues and enhance compliance with current standards

  Background:
    Given an EPUB publication available for validation
    And the system is configured to analyze deprecated features

  Scenario: Scenario 1: Detect deprecated features
    Given an EPUB publication contains deprecated attributes or elements
    When the user runs the validation check
    Then the system raises a warning for each deprecated attribute or element detected
    And each warning includes details about the specific usage notification and the relevant specification

  Scenario: Scenario 2: Handle legacy specifications
    Given the EPUB publication is based on a legacy specification
    When the user runs the validation check
    Then the system performs validation against deprecated features
    And notifies the user that alternative solutions are recommended if a legacy specification is found

  Scenario: Scenario 3: Summary of deprecated occurrences
    Given an EPUB publication with multiple deprecated features identified within a single document
    When the user runs the validation check
    Then the system compiles a summary list of all occurrences of deprecated features
    And includes the list in the output report

  Scenario: Scenario 4: Rerun check after modifications
    Given the user modifies a deprecated feature in the EPUB publication
    When the user reruns the validation check after modifying the deprecated feature
    Then the system confirms the removal of the deprecated warning if the deprecated feature has been modified and verified
    And assures the user that all deprecated features have been addressed
