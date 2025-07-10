Feature: Provide 'Who Are' Subsection with Details

  As a website visitor
  I want to access detailed information about the team members
  So that I can understand their roles and contributions

  Background:
    Given the user is on the 'About Us' page
    And the menu with links to 'Who Are' and 'Where Are' subsections is displayed

  Scenario: Accessing 'Who Are' Subsection
    Given the user clicks on the 'Who Are' link
    When the application fetches the team members' information
    Then the detailed information about the team members is displayed
    And each member's role and contributions are clearly outlined

  Scenario: Accessing 'Who Are' Subsection via Invalid URL
    Given the user attempts to access the 'Who Are' subsection via an invalid URL
    When the system detects the invalid URL
    Then the user is redirected to a standardized 'Not Found' page
    And an informative error message is shown explaining the page is unavailable

  Scenario: Navigation Controls Functionality - Footer
    Given the user is on the 'Who Are' page
    When the user uses navigation controls in the footer to return to the 'About Us' page
    Then the user is returned to the 'About Us' page without errors

  Scenario: Navigation Controls Functionality - Header
    Given the user is on the 'Where Are' page
    When the user uses navigation controls in the header to return to the 'About Us' page
    Then the user is returned to the 'About Us' page without errors

  Scenario Outline: Navigation Controls Functionality from Invalid Section
    Given the user is on an invalid section
    When the user clicks on the navigation control in the footer or header
    Then the user remains on the 'About Us' page without errors
    Examples:
      | Invalid Section | Control Location | Expected Outcome |
      | Nonexistent Page | Footer | Stays on 'About Us' page |
      | Broken Link | Header | Stays on 'About Us' page |

