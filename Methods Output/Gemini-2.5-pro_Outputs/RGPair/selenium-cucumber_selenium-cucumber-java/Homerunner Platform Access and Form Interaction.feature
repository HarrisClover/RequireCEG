Feature: Homerunner Platform Access and Form Interaction

  Scenario: Access Homerunner Homepage and Fill First Name
    Given the user is on the Homerunner landing/login page
    When the user clicks the 'Get Started' button
    And the system switches focus to the new window if necessary
    Then the user should be on the Homerunner homepage
    When the user navigates to the Homerunner form
    And the user enters their first name into the 'First Name' field
    Then the 'Family Name' input field should not be presented or visible