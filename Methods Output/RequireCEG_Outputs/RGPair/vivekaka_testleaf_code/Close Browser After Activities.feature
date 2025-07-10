Feature: Close Browser After Activities

  As a user of the Carwale website
  I want to have an option to save my session data before closing the browser
  So that I can retain my wishlist and browsing history for future use

  Background:
    Given a user is browsing items on the Carwale website
    And the user is logged into their account

  Scenario: Scenario 1: User decides to save session before closing
    Given the user has completed their browsing activities or transactions on the Carwale website
    And the system detects whether there are items present in the user's wishlist
    When the user attempts to close the browser
    Then a prompt should appear asking if the user wants to save their session
    And if the user selects to save, the session data should be securely stored

  Scenario: Scenario 2: User chooses to close browser without saving
    Given the user has completed their browsing activities or transactions on the Carwale website
    And the user has items in their wishlist
    When the user selects to close the browser without saving
    Then all session data related to the browsing activities should be cleared promptly
    And the system should close the browser seamlessly

  Scenario: Scenario 3: User is prompted for session confirmation
    Given the user has items in their wishlist
    When the user is prompted to confirm whether to save the session
    Then if the user chooses to save, the session data should be securely stored

  Scenario Outline: Scenario Outline: User's confirmation on session saving
    Given the user has <item-count> items in their wishlist
    And the user is ready to close the browser
    When the user is prompted to <user-action>
    Then if the user chooses to save, the system should <system-response>
    Examples:
      | item-count | user-action | system-response |
      | 3 | save the session | store the session data securely |
      | 0 | close without saving | clear all session data |

