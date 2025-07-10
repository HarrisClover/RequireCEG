Feature: Integration with Amazon SES

  As a user of the Amazon SES service
  I want to manage email identities associated with my account
  So that I can effectively send and receive emails through my verified addresses

  Background:
    Given that the user has an active Amazon SES account
    And the user possesses the required IAM permissions

  Scenario: Scenario 1: List email identities
    Given that the user issues an API call to list email identities
    When the API call is successful
    Then the system should return a structured response containing all valid email identities

  Scenario: Scenario 2: Attempt to create an invalid email identity
    Given that the user attempts to create a new email identity with an invalid format
    Then the system should return an error code 'InvalidParameter' along with the message 'The provided email format is invalid.'

  Scenario: Scenario 3: Create a new valid email identity
    Given that the user provides a valid email address for creation
    When the system successfully creates the new email identity
    Then the system should return a confirmation message detailing the newly created identity in a structured JSON format

  Scenario: Scenario 4: Invalid email identity operation
    Given that the user provides an invalid identifier for an email identity during an operation
    When the system detects the anomaly
    Then the system should return an error response with code 'InvalidIdentifier' and message 'The email identity does not exist.'

  Scenario: Scenario 5: Access denied when managing email identities
    Given that the user attempts to perform an action on email identities without the necessary IAM permissions
    Then the system should return an error code 'AccessDenied' with the message 'You do not have the required permissions to perform this action.'

  Scenario: Scenario 6: Create an email identity without the necessary permissions
    Given that the user attempts to create a new email identity without the necessary IAM permissions
    Then the system should return an error code 'AccessDenied' with the message 'You do not have the required permissions to perform this action.'

  Scenario: Scenario 7: Attempt to create a new email identity without a valid format
    Given that the user attempts to create a new email identity with an invalid format and does not have permissions
    Then the system should return an error code 'InvalidParameter' along with the message 'The provided email format is invalid.'
