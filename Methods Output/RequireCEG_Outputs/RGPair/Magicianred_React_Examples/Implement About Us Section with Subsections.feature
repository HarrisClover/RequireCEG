Feature: Implement 'About Us' Section with Subsections

  As a user
  I want to navigate through the 'About Us' section and its subsections
  So that I can learn about the people involved and the location related to the application

  Background:
    Given the user is on the home page
    And the 'About Us' section is visible in the menu

  Scenario: User navigates to 'About Us' page
    Given the user selects the 'About Us' section from the home page menu
    When the system redirects the user to the 'About Us' page
    Then the user should see subsections 'Who Are' and 'Where Are'
    And both subsections should have back navigation links

  Scenario: User accesses 'Who Are' subsection
    Given the user is on the 'About Us' page
    When the user clicks on the 'Who Are' subsection
    Then the system displays detailed information about the people involved in the application

  Scenario: User accesses 'Where Are' subsection
    Given the user is on the 'About Us' page
    When the user clicks on the 'Where Are' subsection
    Then the system displays location-related information

  Scenario: User tries to access an invalid path in the 'About Us' section
    Given the user is trying to navigate to an invalid subsection
    When the user attempts to access this invalid path
    Then the system displays a 'Not Found' page indicating that the requested content is unavailable

  Scenario: User checks header menu navigation to 'Who Are'
    Given the header menu provides navigation to the 'Who Are' subsection
    When the user clicks on the 'Who Are' link in the header
    Then the system displays detailed information about the people involved in the application

  Scenario: User checks footer menu navigation to 'Where Are'
    Given the footer menu provides navigation to the 'Where Are' subsection
    When the user clicks on the 'Where Are' link in the footer
    Then the system displays location-related information

  Scenario Outline: Consistent navigation through menus
    Given the header and footer menus provide navigation to 'About Us'
    And the menus seamlessly direct the user to the respective subsections
    When the user selects any subsection from the header or footer
    Then the user should be taken to the correct subsection
    Examples:
      | Menu Location | Subsection | Expected Outcome |
      | Header | Who Are | Displays information about the people involved |
      | Footer | Where Are | Displays location-related information |
      | Header | Invalid Path | Displays 'Not Found' page |

