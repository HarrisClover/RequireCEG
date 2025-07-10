Feature: User Session Management

  As a user
  I want the option to close the browser
  So that my session data is not retained and my privacy is maintained

  Background:
    Given a user is logged into the system
    And the user has completed their transactions or browsing activities

  Scenario: Scenario 1: User closes the browser
    Given the user is on the checkout page
    When the user decides to close the browser
    Then the user's session data should be cleared
    And the user should not be able to retrieve any previous session details

  Scenario: Scenario 2: User logs out before closing
    Given the user is logged into the system
    When the user logs out and then closes the browser
    Then the session data should be cleared

  Scenario: Scenario 3: User closes the browser after completing activity
    Given the user has completed their transaction
    When the user chooses to close the browser
    Then the browser closes
    And the user's session data should not be retained

  Scenario Outline: Scenario Outline: User browsing and closing
    Given the user is browsing the store
    And the user has items in their basket
    When the user closes the browser without checking out
    Then the basket should be empty upon re-login
    Examples:
      | Basket Status | Action | Outcome |
      | Not checked out | Closes browser | Basket is empty |
      | Checked out | Closes browser | Session data is cleared |

