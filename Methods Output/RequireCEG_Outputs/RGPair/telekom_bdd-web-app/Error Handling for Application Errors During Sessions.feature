Feature: Error Handling for Application Errors During Sessions

  As a user
  I want to receive relevant error messages during my interactions with the system
  So that I can understand any issues and take appropriate action

  Background:
    Given the user is logged into the system
    And the user is interacting with various features of the application

  Scenario: Invalid Login Credentials
    Given a user attempts to log in
    When the user provides invalid username or password
    Then the system displays 'Invalid username or password'
    And access to the user's account is prevented

  Scenario: Registration with Invalid Email Format
    Given the user is on the registration page
    When the user enters an incorrect email format
    Then the system displays 'Email format is incorrect'

  Scenario: Registration with Short Password
    Given the user is on the registration page
    When the user enters a password shorter than 8 characters
    Then the system displays 'Password must be at least 8 characters long'

  Scenario: Successful Registration
    Given the user provides valid registration details
    When the user completes the registration
    Then the system redirects the user to the login page
    And displays 'Registration successful, please log in'

  Scenario: No Available Offers for Reservation
    Given the user selects a time for a reservation
    When no offers are available for the selected time
    Then the system informs the user with 'No available offers for the selected time. Please choose another time.'

  Scenario: JavaScript Disabled for Reservations
    Given the user attempts to reserve a ride
    When the user's JavaScript is disabled
    Then the system prompts 'JavaScript is required to make reservations. Please enable it for full functionality.'

  Scenario: Application Error During Session
    Given an active user session is in place
    When an unexpected application error occurs
    Then the system triggers 'An unexpected error occurred. Please try again later.'
    And maintains the user's session state where possible

  Scenario: Invalid Login: Username and Password
    Given a user attempts to log in
    When the user provides invalid username and password
    Then the system displays 'Invalid username or password'
    And access to the user's account is prevented

  Scenario: Successful Registration with Valid Details
    Given the user provides valid registration fields
    When the user completes the registration process
    Then the system redirects the user to the login page
    And displays 'Registration successful, please log in'
