Feature: Allow Custom Metadata Addition

  As a system user
  I want to initiate custom metadata during the error reporting process
  So that I can ensure my error reports contain relevant information for better issue tracking

  Background:
    Given the application is started
    And the user is authenticated

  Scenario: Valid Custom Metadata
    Given the user provides valid custom metadata
    And the metadata is correctly formatted
    When the error report is submitted
    Then the custom metadata should be integrated into the error payload
    And the application should log this event in the breadcrumbs

  Scenario: Invalid Custom Metadata
    Given the user provides invalid custom metadata
    When the error report is submitted
    Then the application should reject the metadata
    And the error report should be submitted without custom metadata

  Scenario: Conflicting Custom Metadata
    Given the user provides both manual and automatic custom metadata
    When the error report is submitted
    Then the application should prioritize manual inputs
    And the automatic data should be overwritten

  Scenario: Format Enforcement
    Given the user specifies a particular format for custom metadata
    When the custom metadata is submitted
    Then the application shall enforce the specified format
    And additional error information should remain intact

  Scenario: Modification After Submission
    Given the user has initiated an error report
    When the user attempts to modify the custom metadata
    Then the application should display a notification that modifications are not permitted
    And the application should reject any further attempts for alterations

  Scenario: Successful Appending of Custom Metadata
    Given the user initiates custom metadata during the error reporting process
    And the format of the custom metadata is compliant with predefined rules
    And the custom metadata is devoid of invalid characters
    When the error report is submitted
    Then the custom metadata should be successfully appended to the error report
    And the application logs the successful appending of custom metadata as an event in the breadcrumbs

  Scenario: Attempting to Modify Custom Metadata
    Given the user attempts to modify custom metadata after the error report has already been initiated
    Then the application should display a notification that modifications to custom metadata are no longer permitted
    And the application should reject attempts for further alterations to the custom metadata
