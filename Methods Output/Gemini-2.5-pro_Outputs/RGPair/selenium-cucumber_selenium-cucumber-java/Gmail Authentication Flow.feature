Feature: Gmail Authentication Flow

  Scenario Outline: Login, Refresh, Logout, and Re-login to Gmail
    # Initial Login
    Given the user is on the Gmail login page
    When the user enters valid credentials: username "<username>" and password "<password>"
    And the user submits the login form
    Then the user should be logged into Gmail
    And the logout link should become visible within a reasonable time

    # Refresh and Logout
    When the user refreshes the current page
    And the user waits for the page to fully load
    And the user clicks the logout link/button
    Then the user should be logged out successfully
    And the username input field should be visible again

    # Re-Login
    When the user enters the same valid credentials again: username "<username>" and password "<password>"
    And the user submits the login form
    Then the user should be logged into Gmail again
    And the logout link should become visible within a reasonable time

    Examples:
      | username             | password        |
      | test.user@gmail.com  | YourSecurePass! |