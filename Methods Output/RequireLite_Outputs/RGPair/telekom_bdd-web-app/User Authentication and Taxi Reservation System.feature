Feature: User Authentication and Taxi Reservation System

  As a user
  I want to log in and register to make reservations for collective taxis
  So that I can easily book shared rides and manage my reservations

  Background:
    Given the system is online
    And the user has valid credentials

  Scenario: User successfully logs into the system
    Given the user has registered an account
    When the user inputs valid login credentials
    Then the user is granted access to the system
    And the user sees a dashboard of available taxi rides

  Scenario: User fails to log in with invalid credentials or inactive account
    Given the user has registered an account but it is inactive
    When the user inputs valid login credentials
    Then the user is shown an error message indicating that the account is inactive
    And the user is prompted to contact support for assistance

  Scenario: User registers a new account successfully
    Given the user is on the registration page
    When the user fills in valid personal details
    Then the user receives a success message
    And the user is redirected to the login page

  Scenario: User tries to reserve a ride without available offers
    Given the user is logged into the system
    When the user attempts to reserve a ride during off-peak hours
    Then the user is informed that no reservations can be made
    And the system provides clarification on what constitutes off-peak hours

  Scenario Outline: User attempts to reserve a ride with JavaScript disabled
    Given the user tries accessing the reservation page with JavaScript off
    When the user selects a taxi ride to reserve
    Then the user receives a message indicating that JavaScript needs to be enabled
    Examples:
      | User State | JavaScript Setting | Expected Outcome |
      | Logged in | Off | JavaScript needs to be enabled for reservations. |
      | Logged out | Off | JavaScript needs to be enabled for registration. |
      | Logged in | On | User has sufficient funds. |
      | Logged in | On | User has insufficient funds. |
      | Logged in | On | User has invalid payment information, reservation not possible. |

