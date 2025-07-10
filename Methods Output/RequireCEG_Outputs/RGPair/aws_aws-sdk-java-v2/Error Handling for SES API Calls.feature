Feature: Error Handling for SES API Calls

  As a user of Amazon SES
  I want to receive appropriate error messages for various issues
  So that I can quickly identify and resolve problems with my requests

  Background:
    Given I am using the Amazon SES API
    And I have valid credentials

  Scenario: Scenario 1: Invalid Email Format
    Given the user inputs an invalid email format
    When the user attempts to verify the email identity
    Then the system should return 'Invalid email format provided.'

  Scenario: Scenario 2: No Verified Identities
    Given the user has no verified email identities in the system
    When the user requests to list verified email identities
    Then the system should return error code 'No verified identities found.'

  Scenario: Scenario 3: Sending Email to Non-existent Address
    Given the user wants to send an email
    When the user tries to send it to a non-existent email address
    Then the system should return the message 'The email address does not exist.'

  Scenario: Scenario 4: Invalid Parameters
    Given the user provides invalid parameters in a request
    When the request is processed
    Then the system should return 'Invalid parameters provided. Please check your request and try again.'

  Scenario: Scenario 5: Authentication Failure
    Given the user provides incorrect AWS credentials
    When the user attempts to authenticate
    Then the system should return error code 'Authentication failed. Please verify your credentials.'

  Scenario: Scenario 6: Invalid Email Format with No Verified Identities
    Given the user inputs an invalid email format
    And the user has no verified email identities in the system
    When the user attempts to verify the email identity
    Then the system should return 'Invalid email format provided.'
    And the system should not allow identity verification due to invalid input.

  Scenario: Scenario 7: Invalid Parameters and Incorrect Credentials
    Given the user provides invalid parameters in a request
    And the user provides incorrect AWS credentials
    When the request is processed
    Then the system should return 'Invalid parameters provided. Please check your request and try again.'
    And the system should respond with error code 'Authentication failed. Please verify your credentials.'
