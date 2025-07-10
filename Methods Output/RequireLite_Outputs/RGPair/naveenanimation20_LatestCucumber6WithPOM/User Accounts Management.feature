Feature: User Accounts Management

  As a store owner
  I want to provide a user-friendly account management system with access to various features
  So that customers can easily manage their orders and personal information

  Background:
    Given a customer has logged into the system
    And the customer has a registered account

  Scenario: Access Accounts Page
    Given the customer is authenticated
    When the customer navigates to the Accounts page
    Then the title 'My account - My Store' should be displayed
    And the following sections should be present: 'ORDER HISTORY AND DETAILS', 'MY CREDIT SLIPS', 'MY ADDRESSES', 'MY PERSONAL INFORMATION', 'MY WISHLISTS', and 'Home'

  Scenario: Submit Contact Us Form Successfully
    Given the customer is on the Contact Us page
    When the customer fills out the form with valid data
    Then the message should be successfully sent to the team
    And the customer should see a confirmation message indicating that the message has been sent

  Scenario: Submit Contact Us Form Unsuccessfully
    Given the customer is on the Contact Us page
    When the customer fills out the form with invalid data
    Then an error message should be displayed indicating the issues with the submission

  Scenario: Successful Login
    Given the login page is displayed with the title 'Login - My Store'
    When the user enters valid credentials
    Then the user should be redirected to the Accounts page with the title 'My account - My Store'
    And the 'Forgot your password?' link is visible

  Scenario: Failed Login Attempt
    Given the login page is displayed with the title 'Login - My Store'
    When the user enters invalid credentials
    Then an error message should be displayed indicating that the login attempt was unsuccessful

  Scenario: Password Reset
    Given the user is on the login page
    When the user clicks on the 'Forgot your password?' link
    Then the user should be taken to the password reset page
