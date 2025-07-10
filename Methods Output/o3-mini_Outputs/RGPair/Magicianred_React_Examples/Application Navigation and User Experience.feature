Feature: Application Navigation and User Experience
  As a user,
  I want to seamlessly navigate through the application
  So that I can easily access information and contact support

  Scenario: Home page displays navigable features
    Given the user navigates to the application's home page
    When the page loads
    Then the user should see a header with menus including "About Us" and "Contact Us"
    And the user should see a footer with links to primary sections and error pages

  Scenario: "About Us" page provides additional navigation options
    Given the user is on the home page
    When the user selects the "About Us" menu option
    Then the "About Us" page should load
    And the page must display links to the subsections "Who Are" and "Where Are"
    And selecting "Who Are" should show details about the people
    And selecting "Where Are" should show details about the places

  Scenario: "Contact Us" form contains required fields with validation
    Given the user navigates to the "Contact Us" page
    When the page loads
    Then the "Contact Us" form should display fields for email, name, and message
    And the form should not allow submission if any required field is empty

  Scenario: Successful "Contact Us" form submission
    Given the user fills in the "Contact Us" form with a valid email, name, and message
    When the user submits the form
    Then the system should display a confirmation page
    And the confirmation page should present the submitted data alongside a thank you message

  Scenario: Handling navigation to invalid paths with a "Not Found" page
    Given the user navigates to an invalid or nonexistent URL
    When the system is unable to locate the page
    Then a consistent "Not Found" page should be displayed
    And the page should provide meaningful feedback to the user

  Scenario: Displaying user-friendly error messages during system errors
    Given an unexpected error occurs during navigation or interaction
    When the error is detected
    Then the system should display a user-friendly error page
    And the error page should offer clear navigation options to return to a safe section of the application
