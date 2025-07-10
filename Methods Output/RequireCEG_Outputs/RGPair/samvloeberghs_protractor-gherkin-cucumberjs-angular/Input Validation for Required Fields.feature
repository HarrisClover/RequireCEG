Feature: Input Validation for Required Fields

  As a user
  I want to ensure that all required fields are filled and valid during registration and account management processes
  So that I can successfully register, log in, reset my password, or recover my account without errors

  Background:
    Given the user is on the registration or account management page
    And the input fields for name, email, password, and confirm password are available

  Scenario: Scenario 1: Missing Required Fields
    Given the name field is empty
    And the email field is empty
    And the password field is empty
    And the confirm password field is empty
    When the user attempts to submit the registration form
    Then an error message should be displayed that all fields must be filled

  Scenario: Scenario 2: Invalid Email Format
    Given the email entered is 'user@invalid'
    When the user attempts to submit the registration form
    Then an error message should be displayed indicating that the email format is invalid

  Scenario: Scenario 3: Password Mismatch
    Given the password entered is 'Password123'
    And the confirm password entered is 'Password321'
    When the user attempts to submit the registration form
    Then an error message should be displayed that the passwords must match

  Scenario: Scenario 4: Password Reset Validation
    Given the new password is 'newPas'
    And the confirm password is 'newPas'
    When the user attempts to reset the password
    Then an error message should be displayed outlining the specific password criteria, including minimum length and complexity

  Scenario: Scenario 5: Non-existent Email for Password Recovery
    Given the email 'nonexistent@example.com' does not exist in the database
    When the user submits the 'Forgot Password' request
    Then the system should inform the user that the email is not associated with any account

  Scenario: Scenario 6: Password Criteria Validation
    Given the new password is 'short'
    And the new password does not contain special characters
    When the user attempts to submit the password reset form
    Then an error message should be displayed outlining the specific password criteria, including minimum length and complexity

  Scenario Outline: Scenario Outline: Successful Registration
    Given the name is '<name>'
    And the email is '<email>'
    And the password is '<password>'
    And the confirm password is '<confirm-password>'
    When the user submits the registration form
    Then the user should be successfully registered with the message '<success-message>'
    Examples:
      | name | email | password | confirm-password | success-message |
      | John Doe | john@example.com | Password123 | Password123 | Registration successful |
      | Jane Smith | jane.smith@example.com | SecurePass456 | SecurePass456 | Registration successful |
      | Alice Johnson | alice.johnson@example.com | MyPass789 | MyPass789 | Registration successful |

