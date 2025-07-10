Given a user is on the forgot password page
When the user submits their email address "<email>"
Then the system should validate the email format
And the system should check if the email is linked to an existing account
When the email is valid and linked to an account
Then the system should send a password reset link to the user's email
When the email is invalid or not linked to an account
Then the system should display an error message indicating invalid email

Given a user is on the login page
When the user submits their email "<email>" and password "<password>"
Then the system should validate if the email and password are correct
When the credentials are valid
Then the user should be logged in and redirected to the dashboard
When the credentials are invalid
Then the system should display an error message indicating invalid email or password

Given a user is on the registration page
When the user enters their name "<name>", email "<email>", password "<password>", and confirms their password "<confirm-password>"
Then the system should validate that all fields are filled
And the system should ensure that the passwords match
And the system should validate that the email format is correct
When the email is valid, and both passwords match
Then the user should be registered and logged in
When the email is invalid, or the passwords do not match
Then the system should display an error message indicating the issue

Given a user has received a password reset email with a link containing a unique nonce and user ID
When the user clicks on the password reset link
Then the system should validate the nonce and user ID
When the nonce and user ID are valid
Then the user should be redirected to the password reset page
When the nonce or user ID is invalid
Then the system should display an error message indicating invalid link

Given the user is on the password reset page
When the user enters their new password "<new-password>" and confirms it "<confirm-password>"
Then the system should validate that the new password meets the required criteria
And the system should check if the new passwords match
When the password is valid and both passwords match
Then the system should reset the user's password
And the user should be redirected to the login page
When the password does not meet the criteria or the passwords do not match
Then the system should display an error message indicating the issue
