Feature: User Login and Taxi Reservation System
As a user,
I want to log in, register, and make shared taxi reservations
So that I can book rides and manage my account securely

Scenario: User Login
Given the user is on the login page
When the user enters valid credentials
Then the user should be logged in successfully
And the user should be redirected to the reservation page

Scenario: User Login with Invalid Credentials
Given the user is on the login page
When the user enters invalid credentials
Then the system should display an appropriate error message
And the user should remain on the login page

Scenario: User Registration
Given the user is on the registration page
When the user fills in valid personal details
And submits the registration form
Then the user should be redirected to the login page
And a success message should be displayed

Scenario: User Registration with Invalid Data
Given the user is on the registration page
When the user fills in invalid personal details
And submits the registration form
Then the system should validate the input and display error messages for invalid data
And the user should remain on the registration page

Scenario: Making a Reservation for a Shared Taxi
Given the user is logged in
And the user is on the reservation page
When the user selects a ride time and a shared taxi offer is available
Then the user should be able to make a reservation
And the ticket price should be displayed with real-time updates

Scenario: No Available Offers for a Shared Taxi
Given the user is logged in
And the user is on the reservation page
When there are no available shared taxi offers at the chosen time
Then the system should display a message stating that no offers are available

Scenario: Making a Reservation with JavaScript Disabled
Given the user is logged in
And JavaScript is disabled in the user's browser
When the user tries to make a reservation
Then the system should display a message informing the user that JavaScript is required
And provide an alternative method for making a reservation

Scenario: Maintaining User Sessions Across Different Test Environments
Given the user is logged in
When the user performs actions in different test environments
Then the user should experience consistent behavior across environments
And the system should maintain the user's session state properly
