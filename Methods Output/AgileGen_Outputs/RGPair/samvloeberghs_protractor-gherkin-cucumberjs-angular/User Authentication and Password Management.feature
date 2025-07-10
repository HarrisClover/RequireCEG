Feature: User Authentication and Password Management
  As a user,
  I want to securely register, log in, reset my password, and manage account access
  So that I can maintain a safe and personalized user experience

Scenario: User initiates forgot password process
  Given the user is on the forgot password page
  When the user submits their email address "<email>"
  Then the system should validate the email format
  And if the email is valid and linked to an account, the system should send a password reset email
  And if the email is invalid or not linked to any account, the system should display an error message

Scenario: User logs into the system with valid credentials
  Given the user is on the login page
  When the user enters a valid email "<email>" and a correct password "<password>"
  Then the system should grant access to the user's account
  And the user should be redirected to their dashboard

Scenario: User logs into the system with invalid credentials
  Given the user is on the login page
  When the user enters an invalid email "<email>" or incorrect password "<password>"
  Then the system should display an error message indicating invalid credentials

Scenario: User registers an account with valid details
  Given the user is on the registration page
  When the user enters a name "<name>", email "<email>", password "<password>", and confirms the password "<confirm-password>"
  Then the system should validate that all fields are filled
  And the system should check that both passwords match
  And the system should validate the password according to defined criteria
  And if all validations pass, the system should create the account and send a confirmation email

Scenario: User registers an account with missing or invalid details
  Given the user is on the registration page
  When the user enters incomplete or invalid information
  Then the system should display appropriate error messages indicating which fields need correction

Scenario: User resets their password
  Given the user has received a password reset email with a unique nonce and user ID
  When the user clicks the reset password link
  Then the system should validate the nonce and user ID
  And if the validation passes, the system should allow the user to enter and confirm a new password
  And the new password should meet the defined criteria
  And the system should confirm the password change and redirect the user to the login page

Scenario: User fails to reset their password with invalid nonce or ID
  Given the user has received a password reset email with an invalid nonce or user ID
  When the user clicks the reset password link
  Then the system should display an error message indicating the reset link is invalid or expired
