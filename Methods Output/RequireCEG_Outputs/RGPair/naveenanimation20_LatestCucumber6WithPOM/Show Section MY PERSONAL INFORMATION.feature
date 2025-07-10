Feature: Show Section 'MY PERSONAL INFORMATION'

  As a registered user
  I want to view and update my personal information
  So that I can ensure my contact details are accurate and up to date

  Background:
    Given the user is logged into the application
    And the user navigates to the 'MY PERSONAL INFORMATION' section

  Scenario: Scenario 1: Display personal information
    Given the user's information includes their name and email address
    When the user views the 'MY PERSONAL INFORMATION' section
    Then the application should display the user's name and email address
    And the message 'Information not available' should not be displayed

  Scenario: Scenario 2: Missing email information
    Given the user's information is missing the email address
    When the user views the 'MY PERSONAL INFORMATION' section
    Then the application should display the message 'Information not available'

  Scenario: Scenario 3: Update personal information with valid data
    Given the user enters valid new personal information for both name and email address
    When the user submits the update
    Then the application should save the changes
    And a confirmation message 'Your information has been updated successfully' should be displayed

  Scenario: Scenario 4: Update personal information with invalid data
    Given the user enters invalid personal information where fields are empty or incorrect
    When the user submits the update
    Then the application should not save the changes
    And an error message specifying the necessary corrections should be displayed

  Scenario: Scenario 5: Validating email field format
    Given the user enters an email address
    When the user submits the email for validation
    Then the system should return appropriate validation feedback based on the email format
