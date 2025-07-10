Feature: Implement 'Not Found' Page for Invalid Paths

  As a website user
  I want to receive feedback when I navigate to an invalid URL or a nonexistent section
  So that I can understand the error and easily find my way back to valid content

  Background:
    Given a user is on the website
    And the user attempts to access an invalid URL

  Scenario: Scenario 1: Invalid URL Access
    Given the user types an invalid URL into the address bar
    When the request is intercepted by the system
    Then the user should see a 'Not Found' page
    And the page should display a user-friendly message indicating that the requested page cannot be found.

  Scenario: Scenario 2: Nonexistent Section Access via Header Menu
    Given the user accesses a nonexistent section through the header menu
    When the user selects the link
    Then the user should be redirected to the 'Not Found' page

  Scenario: Scenario 3: Nonexistent Section Access via Footer Menu
    Given the user accesses a nonexistent section through the footer menu
    When the user selects the link
    Then the user should be redirected to the 'Not Found' page

  Scenario: Scenario 4: Clickable Links on 'Not Found' Page
    Given the user is on the 'Not Found' page
    When the user clicks on a valid link within the page
    Then the application should allow navigation to valid sections.

  Scenario: Scenario 5: Accessing Invalid Paths with Invalid URL
    Given the user types into the address bar an invalid path /invalid-page
    When the system intercepts the request
    Then the user should see the 'Not Found' page
    And the page should also provide prominent links directing to the home page.

  Scenario Outline: Scenario Outline: Accessing Invalid Paths
    Given the user types into the address bar an invalid path <invalid-path>
    When the system intercepts the request
    Then the user should see the 'Not Found' page with a user-friendly message
    Examples:
      | invalid-path |
      | /invalid-page |
      | /nonexistent-category |
      | /random-string |

