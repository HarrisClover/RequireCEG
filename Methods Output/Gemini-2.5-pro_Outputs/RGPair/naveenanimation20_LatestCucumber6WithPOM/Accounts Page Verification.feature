Feature: Accounts Page Verification
  As a logged-in user
  I want to view my account page
  So that I can access my order history, personal information, and other account-related sections

  Scenario: Verify Accounts Page Content After Login
    Given I have successfully logged in with username "dec2020secondbatch@gmail.com" and password "Selenium@12345"
    When I navigate to the Accounts page
    Then the page title should be "My account - My Store"
    And the section "ORDER HISTORY AND DETAILS" should be visible
    And the section "MY CREDIT SLIPS" should be visible
    And the section "MY ADDRESSES" should be visible
    And the section "MY PERSONAL INFORMATION" should be visible
    And the section "MY WISHLISTS" should be visible
    And the "Home" link or button should be visible