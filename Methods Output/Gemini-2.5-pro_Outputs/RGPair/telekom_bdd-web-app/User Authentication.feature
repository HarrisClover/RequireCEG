Feature: User Authentication

  As a user of the collective taxi service,
  I want to be able to register for a new account and log in to my existing account,
  So that I can access the reservation features.

  Scenario: Successful Login
    Given a registered user exists with email "test@example.com" and password "password123"
    When the user navigates to the login page
    And the user enters "test@example.com" into the email field
    And the user enters "password123" into the password field
    And the user clicks the "Login" button
    Then the user should be redirected to the main reservation page
    And the user should see a welcome message

  Scenario Outline: Login Attempt with Invalid Data
    Given a registered user exists with email "test@example.com" and password "password123"
    When the user navigates to the login page
    And the user enters "<email>" into the email field
    And the user enters "<password>" into the password field
    And the user clicks the "Login" button
    Then the user should remain on the login page
    And the user should see an error message "<error_message>"

    Examples:
      | email             | password        | error_message        |
      | test@example.com  | wrongpassword   | Invalid credentials  |
      | nonexist@example.com | password123   | Invalid credentials  |
      |                   | password123   | Email is required    |
      | test@example.com  |                 | Password is required |

  Scenario: Successful Registration
    Given the user navigates to the registration page
    When the user fills in "First Name" with "John"
    And the user fills in "Last Name" with "Doe"
    And the user fills in "Email" with "newuser@example.com"
    And the user fills in "Phone Number" with "1234567890"
    And the user fills in "Password" with "securepass!"
    And the user confirms the password with "securepass!"
    And the user clicks the "Register" button
    Then the user should be redirected to the login page
    And the user should see a success message "Registration successful. Please log in."

  Scenario Outline: Registration Attempt with Invalid Data
    Given the user navigates to the registration page
    When the user fills in the "<field>" with "<value>"
    And the user fills in other required fields correctly
    And the user clicks the "Register" button
    Then the user should remain on the registration page
    And the user should see an error message "<error_message>" related to the "<field>"

    Examples:
      | field        | value           | error_message                   |
      | Email        | invalid-email   | Invalid email format            |
      | Password     | short           | Password must be at least 8 characters |
      | Confirm Password | mismatchpass! | Passwords do not match          |
      | First Name   |                 | First Name is required          |
      # Add other validation examples as needed

  Scenario: Registration Attempt with Existing Email
    Given a registered user exists with email "existing@example.com"
    And the user navigates to the registration page
    When the user fills in "Email" with "existing@example.com"
    And the user fills in other required fields correctly
    And the user clicks the "Register" button
    Then the user should remain on the registration page
    And the user should see an error message "Email address already in use"