Feature: Update Existing User Account Information

  As a user
  I want to update my account information
  So that I can keep my profile current and accurate

  Background:
    Given a user has valid credentials
    And the user is logged into the system

  Scenario: Successful account update with all required fields
    Given the user provides a valid username and password
    And the user has filled in all required fields
    When the user submits the account update request
    Then the system should update the user account details in the database
    And the system should return a success message along with the updated account information

  Scenario: Account update fails due to missing fields
    Given the user provides a valid username and password
    When the user submits the account update request with missing fields
    Then the system should return an error message indicating the specific fields that are missing

  Scenario: Account update fails due to invalid credentials
    Given the user provides an invalid username or password
    When the user attempts to submit the account update request
    Then the system should respond with an authentication failure message

  Scenario: Account update fails due to incorrectly formatted data
    Given the user provides valid credentials
    And the user fills in all required fields with incorrect data formats
    When the user submits the account update request
    Then the system should return a validation error detailing what needs correction

  Scenario: Account update fails when not all required fields are provided
    Given the user provides valid credentials
    When the user submits an account update request missing at least one required field
    Then the system should return an error message indicating which fields are missing

  Scenario Outline: Testing account update variations with different usernames and fields
    Given the user provides <username> as the username
    And the password is <password>
    And the required fields are <fields>
    When the user submits the account update request
    Then the system should return <outcome>
    Examples:
      | username | password | fields | outcome |
      | validUser | validPass | all required fields | success message with updated information |
      | validUser | validPass | missing email | error message for missing email |
      | invalidUser | wrongPass | all required fields | authentication failure message |
      | validUser | validPass | incorrect formatted phone number | validation error for phone number |

