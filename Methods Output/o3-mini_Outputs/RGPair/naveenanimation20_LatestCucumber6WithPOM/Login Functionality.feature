Feature: Login Functionality
As a user, I want to log in successfully so that I can access my account details.

Scenario: Display of the Login Page
Given the user navigates to the login page
Then the page title should be "Login - My Store"
And the "Forgot your password?" link is visible

Scenario: Successful Login
Given the user is on the login page
When the user enters the username "dec2020secondbatch@gmail.com"
And the user enters the password "Selenium@12345"
And the user clicks the login button
Then the user should be redirected to the Accounts page
And the page title should be "My account - My Store"

