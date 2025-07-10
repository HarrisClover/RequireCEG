Feature: Use Various Datasets for Form Submission

  As a user
  I want to submit a contact form with my details
  So that I can communicate with the support team effectively

  Background:
    Given the contact form is available
    And the user wants to submit an inquiry

  Scenario: Valid submission
    Given the name field is filled with 'John Doe'
    And the email field is filled with 'john@example.com'
    And the message field is filled with 'I need assistance'
    And the department is selected as 'Support'
    When the user submits the contact form
    Then the message should be sent to the support team
    And a confirmation message should be displayed saying 'Your message has been sent to the team. Thank you for contacting us!'

  Scenario: Missing name
    Given the name field is left empty
    And the email field is filled with 'john@example.com'
    And the message field is filled with 'I need assistance'
    When the user submits the contact form
    Then the submission should be invalid
    And an error message should be displayed saying 'Name is required.'

  Scenario: Invalid email
    Given the name field is filled with 'John Doe'
    And the email field is filled with 'john@invalid'
    And the message field is filled with 'I need assistance'
    When the user submits the contact form
    Then the submission should be invalid
    And an error message should be displayed saying 'Please enter a valid email address.'

  Scenario: Empty message
    Given the name field is filled with 'John Doe'
    And the email field is filled with 'john@example.com'
    And the message field is left empty
    When the user submits the contact form
    Then the submission should be invalid
    And an error message should be displayed saying 'Message cannot be empty.'

  Scenario: Incomplete submission
    Given the name field is filled with 'Jane Doe'
    And the email field is filled with 'jane@example.com'
    And the message field is filled with 'Please contact me.'
    And the department is not selected
    When the user submits the contact form
    Then the submission should be invalid
    And an error message should be displayed saying 'A department must be selected.'

  Scenario Outline: Scenario Outline: Validate fields in contact form
    Given the name field is filled with '<name>'
    And the email field is filled with '<email>'
    And the message field is filled with '<message>'
    And the department is selected as '<department>'
    When the user submits the contact form
    Then the submission should be '<submission-status>'
    And the output message should be '<output-message>'
    Examples:
      | name | email | message | department | submission-status | output-message |
      | Jane Smith | jane@example.com | Request for a quote | Sales | valid | Your message has been sent to the team. Thank you for contacting us! |
      |  | jane@example.com | Request for a quote | Sales | invalid | Name is required. |
      | Jane Smith | invalid_email | Request for a quote | Sales | invalid | Please enter a valid email address. |
      | Jane Smith | jane@example.com |  | Sales | invalid | Message cannot be empty. |
      | John Doe | john@example.com | Question about product |  | invalid | A department must be selected. |

