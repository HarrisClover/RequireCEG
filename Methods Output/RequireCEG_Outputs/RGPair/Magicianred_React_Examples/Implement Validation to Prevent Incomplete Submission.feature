Feature: Implement Validation to Prevent Incomplete Submission

  As a user
  I want to ensure all fields are filled correctly before submitting the contact form
  So that I can successfully send my message without missing any required information

  Background:
    Given the contact form is displayed
    And all fields are empty

  Scenario: Scenario 1: Empty Name Field
    Given the name field is empty
    When the user attempts to submit the form
    Then an error message should indicate that the name field is required
    And the form submission is prevented

  Scenario: Scenario 2: Empty Email Field
    Given the email field is empty
    When the user attempts to submit the form
    Then an error message should prompt that the email field must be filled
    And the form submission is prevented

  Scenario: Scenario 3: Empty Message Field
    Given the message field is empty
    When the user attempts to submit the form
    Then an error message should indicate that the message field cannot be empty
    And the form submission is prevented

  Scenario: Scenario 4: All Fields Completed Correctly
    Given the name field, email field, and message field are filled
    When the user submits the form
    Then the system processes the form submission
    And the user is redirected to a confirmation page displaying a thank you message with the submitted data

  Scenario: Scenario 5: All Fields Empty
    Given the name field is empty, the email field is empty, and the message field is empty
    When the user attempts to submit the form
    Then an error message should indicate that all fields must be filled
    And the form submission is prevented

  Scenario Outline: Scenario Outline: Incomplete Form Submission Cases
    Given the <field> field is <status>
    When the user attempts to submit the form
    Then an appropriate error message should be displayed for the <field>
    And the form submission is prevented
    Examples:
      | field | status |
      | name | empty |
      | email | empty |
      | message | empty |

