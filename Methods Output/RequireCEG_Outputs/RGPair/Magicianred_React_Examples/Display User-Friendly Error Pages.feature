Feature: Display User-Friendly Error Pages

  As a website user
  I want to receive clear error messages when encountering issues
  So that I can easily understand the problem and navigate efficiently

  Background:
    Given the user tries to access a page
    And the page does not exist or an error occurs

  Scenario: Scenario 1: Page Not Found
    Given the user requests a non-existent page
    When the page is not found
    Then the user should see a 'Not Found' error page
    And the error page displays a message indicating the requested page cannot be found
    And the error page includes links to the home page and other important sections

  Scenario: Scenario 2: Internal Server Error
    Given the user makes a request that results in an internal error
    When the internal server error occurs
    Then the user should see a user-friendly error page
    And the error page suggests the user refresh the page or contact support
    And the error page contains navigation links for ease of use

  Scenario: Scenario 3: Contact Us Form Error
    Given the user submits the 'Contact Us' form
    When the user leaves required fields empty
    Then the system displays specific error messages next to the empty fields
    And the user is guided to complete the fields before submission

  Scenario: Scenario 4: Successful Form Submission
    Given the user fills out the 'Contact Us' form with all required fields
    When the user submits the form
    Then the system redirects the user to a confirmation page
    And the confirmation page shows the submitted data and a thank you message

  Scenario: Scenario 5: Contact Us Form with Empty Required Fields
    Given the user submits the 'Contact Us' form
    When the user submits the form with required fields empty
    Then the system does not redirect the user to a confirmation page
    And the system displays error messages for the empty fields
