Feature: User Navigation and Error Handling

  As a user,  
  I want to easily navigate through the application,  
  So that I can access the home page, subsections, and error pages without confusion.

  Scenario: Access the Home Page
    Given that the user has launched the application
    When the user lands on the home page
    Then the home page should display headers, footers, and primary navigation menus
    And the user should be able to access the 'About Us' and 'Contact Us' pages

  Scenario: Navigate to 'About Us' and 'Contact Us' pages
    Given that the user is on the home page
    When the user clicks on the 'About Us' link in the navigation menu
    Then the user should be directed to the 'About Us' page
    And the user should see subsections like 'Who Are' and 'Where Are'
    
    Given that the user is on the home page
    When the user clicks on the 'Contact Us' link in the navigation menu
    Then the user should be directed to the 'Contact Us' page
    And the 'Contact Us' page should include a form with fields for email, name, and message

  Scenario: Submit the 'Contact Us' form successfully
    Given that the user is on the 'Contact Us' page
    And the user has entered their email, name, and message
    When the user submits the form
    Then the user should see a confirmation page with the submitted data
    And a thank you message

  Scenario: Submit the 'Contact Us' form with missing fields
    Given that the user is on the 'Contact Us' page
    And the user has not filled all the required fields
    When the user tries to submit the form
    Then the user should see a validation error message indicating missing fields

  Scenario: Encountering an error page
    Given that the user is trying to access an invalid path
    When the user encounters an error
    Then the user should see a user-friendly error page with guidance on what went wrong

  Scenario: Accessing a 'Not Found' page
    Given that the user navigates to a non-existent path
    When the user tries to access the invalid path
    Then the user should be redirected to a 'Not Found' page
    And the page should display a message stating that the page does not exist
