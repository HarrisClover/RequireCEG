Feature: Include 'Home' Section Link

  As a user
  I want to navigate easily between the Accounts page and the Home page
  So that I can enhance my overall user experience

  Background:
    Given the user is not logged in
    And the user is on the Accounts page

  Scenario: User clicks 'Home' link without logging in
    Given the user tries to click the 'Home' section link
    Then the system prompts the user with a login requirement message
    And access to the Accounts page is prevented

  Scenario: User logs in with valid credentials
    Given the user has valid login credentials
    When the user logs in successfully
    Then the system confirms the authentication process
    And the Accounts page loads with the title 'My account - My Store'

  Scenario: User tries to access Accounts page when not logged in
    Given the user is not logged in
    And the user is on the Accounts page
    Then the system prevents access to the Accounts page until successful authentication

  Scenario Outline: User navigates to 'Home' section after logging in
    Given the user is logged in
    And the Accounts page is displayed
    When the user clicks on the 'Home' section link
    Then the system redirects the user to the Home page
    Examples:
      | User Status | Page | Outcome |
      | logged in | Accounts | navigates successfully to Home page |
      | not logged in | Accounts | prompted with login requirement |

