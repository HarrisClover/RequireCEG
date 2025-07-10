Feature: Show Successful Submission Message after Sending

  As a user
  I want to submit my inquiry through the Contact Us form
  So that I can receive confirmation that my message has been sent to the team

  Background:
    Given the Contact Us form is displayed
    And the user has valid data to submit

  Scenario: Successful Submission
    Given the user fills out all required fields in the Contact Us form correctly
    When the user clicks the submit button
    Then a successful submission message should be displayed
    And the message should indicate that the inquiry has been sent to the team

  Scenario: Incomplete Submission
    Given the user has not filled out all required fields in the Contact Us form
    When the user clicks the submit button
    Then an error message should be displayed
    And the message should prompt the user to complete all necessary fields

  Scenario: Navigation Away Before Submission
    Given the user has filled out the Contact Us form with valid data
    When the user navigates away from the Contact Us page before clicking the submit button
    Then the successful submission message should not be displayed

  Scenario: Submission with Valid Data after Required Fields
    Given the user has filled out the Contact Us form correctly
    And the user has clicked the submit button
    Then a successful submission message should be displayed
    And the message should confirm that the message has been sent

  Scenario: Error Without Required Fields
    Given the user has filled out the Contact Us form but missed some required fields
    When the submit button is clicked
    Then an error message should be displayed
    And the error message should prompt the user to complete all necessary fields
