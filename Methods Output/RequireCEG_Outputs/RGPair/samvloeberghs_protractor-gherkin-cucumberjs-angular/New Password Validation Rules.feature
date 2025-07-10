Feature: New Password Validation Rules

  As a user
  I want to set a new password that is secure and meets all requirements
  So that my account is protected against unauthorized access

  Background:
    Given the user is on the password update page
    And the user needs to enter a new password and confirm it

  Scenario: Valid password update
    Given the user enters a new password 'StrongP@ss1'
    And the user confirms the password with 'StrongP@ss1'
    When the system validates the password
    Then the password is updated successfully
    And the message 'Your password has been updated successfully.' is displayed

  Scenario: Password too short
    Given the user enters a new password 'Short1'
    And the user confirms the password with 'Short1'
    When the system validates the password
    Then the message 'Password must be at least 8 characters long.' is displayed

  Scenario: Missing uppercase letter
    Given the user enters a new password 'shortpassword1@'
    And the user confirms the password with 'shortpassword1@'
    When the system validates the password
    Then the message 'Password must contain at least one uppercase letter.' is displayed

  Scenario: Missing number
    Given the user enters a new password 'StrongPassword!'
    And the user confirms the password with 'StrongPassword!'
    When the system validates the password
    Then the message 'Password must include at least one number.' is displayed

  Scenario: Missing special character
    Given the user enters a new password 'StrongPassword1'
    And the user confirms the password with 'StrongPassword1'
    When the system validates the password
    Then the message 'Password must include at least one special character.' is displayed

  Scenario: Passwords do not match
    Given the user enters a new password 'ValidP@ss1'
    And the user confirms the password with 'InvalidP@ss1'
    When the system validates the password
    Then the message 'Passwords do not match. Please try again.' is displayed

  Scenario: Password containing only special characters
    Given the user enters a new password '@#$%^&*()'
    And the user confirms the password with '@#$%^&*()'
    When the system validates the password
    Then the message 'Password must be at least 8 characters long.' is displayed
