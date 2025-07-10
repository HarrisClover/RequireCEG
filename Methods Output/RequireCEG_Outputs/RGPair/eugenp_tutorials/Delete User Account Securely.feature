Feature: Delete User Account Securely

  As a user
  I want to delete my account securely
  So that my personal data is removed from the system

  Background:
    Given the user is logged in
    And the user wants to delete their account

  Scenario: User attempts to delete account without authentication
    Given the user is not authenticated
    When the user requests account deletion
    Then the system responds with an error message
    And the message states 'Unauthorized access – please log in to delete your account.'

  Scenario: User successfully authenticates and initiates account deletion
    Given the user provides valid authentication credentials
    When the user requests to delete their account
    Then the system initiates the account deletion process
    And the user receives a confirmation message indicating that the account will be permanently deleted

  Scenario: Technical issues during account deletion process
    Given the user has authenticated and initiated account deletion
    When there is a technical issue during the deletion process
    Then the system returns a failure notification
    And the message states 'Account deletion failed – please try again later.'

  Scenario: Account deletion process completes successfully
    Given the user has authenticated and initiated account deletion
    And the deletion process is successful
    When the deletion process completes
    Then the system confirms successful deletion of the account
    And the user receives a notification that their account has been deleted successfully

  Scenario: User attempts to delete account with failed authentication
    Given the user fails to provide valid authentication credentials
    When the user requests account deletion
    Then the system responds with an error message
    And the message states 'Unauthorized access – please log in to delete your account.'

  Scenario: System processing deletion when technical issues occur
    Given the user has provided valid authentication credentials
    When the deletion process encounters a technical issue
    Then the system returns a failure notification
    And the message states 'Account deletion failed – please try again later.'
