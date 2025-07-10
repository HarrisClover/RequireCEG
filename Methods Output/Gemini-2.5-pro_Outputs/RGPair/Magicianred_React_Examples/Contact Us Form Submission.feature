Feature: Contact Us Form Submission
  As a user
  I want to submit messages through the Contact Us form
  So that I can communicate with the organization.

  Background:
    Given the user is on the "Contact Us" page

  Scenario: Viewing the Contact Us Form
    Then the user should see a form with fields for "email", "name", and "message"
    And the user should see a submit button

  Scenario Outline: Attempting Form Submission with Missing Required Fields
    When the user enters "<email>" into the email field
    And the user enters "<name>" into the name field
    And the user enters "<message>" into the message field
    And the user attempts to submit the form
    Then the form submission should be prevented
    And the user should see a validation message indicating required fields are missing

    Examples:
      | email              | name        | message         |
      |                    | Test User   | Test Message    |
      | test@example.com |             | Test Message    |
      | test@example.com | Test User   |                 |
      |                    |             |                 |

  Scenario: Successful Form Submission and Confirmation
    Given the user enters "test.user@example.com" into the email field
    And the user enters "Test User Name" into the name field
    And the user enters "This is a test message." into the message field
    When the user submits the form
    Then the user should be redirected to a confirmation page
    And the confirmation page should display the submitted data: "test.user@example.com", "Test User Name", "This is a test message."
    And the confirmation page should display a "thank you" message