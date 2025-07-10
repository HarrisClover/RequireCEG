Feature: Accounts Page Display
As a logged in user, I want to see my account information so that I can manage my orders, addresses, and other settings.

Scenario: Display of Account Sections
Given the user has successfully logged in and is viewing the Accounts page
Then the page title should be "My account - My Store"
And the following sections should be visible:

"ORDER HISTORY AND DETAILS"

"MY CREDIT SLIPS"

"MY ADDRESSES"

"MY PERSONAL INFORMATION"

"MY WISHLISTS"

"Home"

