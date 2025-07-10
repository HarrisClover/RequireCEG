Feature: User Documentation for the Web App

  As a user
  I want to view user documentation for the website
  So that I can know how to use the web app

  Background:
    Given there is user documentation available on the website
    And the user documentation is easy to understand

  Scenario: Scenario 1: Accessing User Documentation Successfully
    Given the user is on the website
    When the user navigates to the user documentation page
    Then the user should be able to read the user documentation
    And the user should understand how to use the web app

  Scenario: Scenario 2: User Documentation Unavailable
    Given the user is on the website
    When the user navigates to the user documentation page
    Then the user should see an error message indicating that documentation is currently unavailable
    And the user should be offered alternative resources or support options

  Scenario Outline: Scenario Outline: User Documentation Page Down
    Given the user navigates to the user documentation page and it is <status>
    When the user tries to access the documentation
    Then the user should not be able to know how to use the web app
    And the user sees a specific error message related to the <status>
    Examples:
      | status | error message | alternative support |
      | down | The documentation service is currently down. Please check back later. | Contact support. |
      | not responding | The documentation is not responding at this time. Please try again. | Visit our FAQ. |
      | error page | An error has occurred while loading the documentation. Please refresh. | Reach out to our help center. |

