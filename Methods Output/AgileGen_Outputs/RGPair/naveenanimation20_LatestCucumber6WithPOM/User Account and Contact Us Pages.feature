Feature: User Account and Contact Us Pages
As a user,
I want to be able to access my account details and contact the support team,
So that I can manage my orders and communicate with customer service effectively.

Scenario: Accessing the Account Page
Given the user is logged into the system with valid credentials
When the user navigates to the "My Account" page
Then the page title should be "My account - My Store"
And the page should display the following sections:
  | ORDER HISTORY AND DETAILS |
  | MY CREDIT SLIPS |
  | MY ADDRESSES |
  | MY PERSONAL INFORMATION |
  | MY WISHLISTS |
  | Home |

Scenario: Navigating to the Contact Us Page
Given the user is logged into the system
When the user navigates to the "Contact Us" page
Then the page should contain a form for the user to fill out
And after submitting the form with valid data, a successful message should be displayed: "Your message has been successfully sent to the team."

Scenario: Logging in to the System
Given the user is on the login page with the title "Login - My Store"
When the user enters the username "dec2020secondbatch@gmail.com" and the password "Selenium@12345"
Then the user should be redirected to the "My Account" page with the title "My account - My Store"
