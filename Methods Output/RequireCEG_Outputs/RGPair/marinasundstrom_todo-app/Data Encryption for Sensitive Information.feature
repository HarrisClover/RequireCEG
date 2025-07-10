Feature: Data Encryption for Sensitive Information

  As a user managing tasks
  I want the application to automatically detect and encrypt sensitive information in my tasks
  So that my sensitive data remains secure and is protected throughout the task management process

  Background:
    Given the user is logged into the application
    And the session is active

  Scenario: Automatically encrypt sensitive data
    Given the user creates a new task with sensitive information in the description
    When the task is saved
    Then the sensitive information should be encrypted using AES
    And the encrypted data should be securely stored in the Todo list

  Scenario: Decrypt sensitive data on retrieval
    Given the user retrieves their Todo list
    When the application identifies encrypted fields
    Then the application should decrypt the sensitive information using the appropriate keys
    And the original sensitive data should be displayed securely

  Scenario: Mask sensitive information after inactivity
    Given the user's session has been inactive for 10 minutes
    When the user attempts to view their Todo list
    Then all visible sensitive information should be masked
    And a placeholder message should indicate that the data is masked for security

  Scenario: Re-authenticate to access sensitive information
    Given the user receives a masked Todo list after inactivity
    When the user re-authenticates successfully
    Then full access to the task details should be restored

  Scenario: Monitor encryption for sensitive data
    Given the user creates a new task with sensitive information in the description
    When the application detects the presence of sensitive data
    Then the sensitive data should be encrypted and stored securely in the Todo list

  Scenario: Ensure decryption upon retrieval
    Given the user retrieves their Todo list
    When the application recognizes encrypted fields
    Then the application should decrypt the information and display it securely
    And the appropriate decryption keys must be available for this action

  Scenario: Session inactivity leading to masking
    Given the user's session has been inactive for 10 minutes
    When the user attempts to view their Todo list
    Then all visible sensitive information should be masked
    And a placeholder message should indicate that the data is masked for security
