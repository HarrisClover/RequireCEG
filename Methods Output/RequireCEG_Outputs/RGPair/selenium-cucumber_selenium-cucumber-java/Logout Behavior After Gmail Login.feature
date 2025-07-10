Feature: Logout Behavior After Gmail Login

  As a user logging into Gmail
  I want to see a logout link upon a successful login
  So that I can manage my session appropriately

  Background:
    Given the user has valid Gmail credentials

  Scenario: Display Logout Link on Successful Login
    When the user has successfully logged into Gmail using valid credentials
    Then the system displays the logout link after a successful session in Gmail

  Scenario: Page Refresh Maintains Logout Link
    When the user refreshes the Gmail page after logging in
    Then the logout link should remain visible

  Scenario: Consistent Logout Behavior on Re-login
    When the user logs back into Gmail using the same valid credentials
    Then the logout link visibility conditions should remain consistent
