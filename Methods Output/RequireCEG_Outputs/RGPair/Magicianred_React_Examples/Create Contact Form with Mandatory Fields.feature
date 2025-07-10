Feature: Create Contact Form with Mandatory Fields

  As a user
  I want to submit a contact form with mandatory fields
  So that I can receive confirmation of my submission

  Background:
    Given the user accesses the 'Contact Us' page
    And the contact form is displayed with 'Name', 'Email', and 'Message' fields

  Scenario: Scenario 1: Name field is empty
    Given the user leaves the 'Name' field empty
    When the user submits the contact form
    Then the system should display an error message 'Please fill in your name.'

  Scenario: Scenario 2: Email field is empty
    Given the user leaves the 'Email' field empty
    When the user submits the contact form
    Then the system should display an error message 'Please provide a valid email address.'

  Scenario: Scenario 3: Email field is invalid
    Given the user enters an invalid email format in the 'Email' field
    When the user submits the contact form
    Then the system should display an error message 'Please provide a valid email address.'

  Scenario: Scenario 4: Message field is empty
    Given the user leaves the 'Message' field empty
    When the user submits the contact form
    Then the system should display an error message 'Message is required.'

  Scenario: Scenario 5: Successful submission
    Given the user fills in the 'Name', 'Email', and 'Message' fields with valid data
    When the user submits the contact form
    Then the form should be submitted successfully
    And the user should be redirected to a confirmation page displaying the entered data and a 'Thank you for your submission!' message

  Scenario: Scenario 6: Processing error during submission
    Given the user fills in the fields correctly
    When an error occurs during form submission
    Then the user should be redirected to a user-friendly error page detailing the issue encountered

  Scenario: Scenario 7: C5 and C6 dependencies
    Given the user fills in all mandatory fields correctly
    When an error occurs during form submission
    Then the user should be redirected to a user-friendly error page detailing the issue encountered
