Feature: Homerunner, Gmail and Wikipedia User Interactions

  # Scenario for Homerunner platform login and homepage access
  Scenario: Login to Homerunner and access the homepage
    Given the user navigates to the Homerunner login page
    When the user clicks the "Get Started" button
    And the user switches to the newly opened window
    Then the Homerunner homepage should be displayed

  # Scenario for filling out the Homerunner form
  Scenario: Complete Homerunner form with a first name only
    Given the user is on the Homerunner registration form
    When the user enters their first name "John"
    Then the family name field should not be presented

  # Scenario Outline for Gmail login and logout with refresh behavior
  Scenario Outline: Login, refresh, logout and re-login on Gmail
    Given the user is on the Gmail login page
    When the user logs in using the username "<username>" and password "<password>"
    Then the logout link should be displayed
    When the user refreshes the page
    And the user logs out
    Then the username input field should be visible
    When the user logs in again using the same username "<username>" and password "<password>"
    Then the logout link should be displayed

    Examples:
      | username             | password         |
      | sample@gmail.com     | samplePassword   |

  # Scenario for Wikipedia search by a non-logged-in user
  Scenario: Perform a search on Wikipedia as a non-logged-in user
    Given a non-logged-in user navigates to the Wikipedia homepage
    When the user selects a language from the dropdown
    And the user enters "Automation" into the search input field
    And the user clicks the search button
    Then the search results should be displayed after a brief wait
    And the user closes the browser
