Feature: Implement Case-Sensitive Passwords

  As a user
  I want to have my password stored in a case-sensitive manner
  So that my account is more secure by differentiating between uppercase and lowercase letters

  Background:
    Given the system supports case-sensitive password storage
    And the user has a valid email for registration

  Scenario: Scenario 1: Successful Login with Correct Password
    Given the user has registered with a password 'SecurePassword123'
    And the user is on the login page
    When the user enters 'SecurePassword123' as the password
    Then the user should be granted access
    And the user should be directed to the dashboard

  Scenario: Scenario 2: Failed Login with Incorrect Password
    Given the user has registered with a password 'SecurePassword123'
    And the user is on the login page
    When the user enters 'securepassword123' as the password
    Then the user should see an error message
    And the message should say 'Incorrect credentials. Please try again.'

  Scenario: Scenario 3: Password Creation with Case Sensitivity Encouragement
    Given the user is registering a new account
    When the user enters a password 'securepassword'
    Then the system should prompt encouragement
    And the message should say 'Using a mix of uppercase and lowercase letters adds security to your password. Consider employing case sensitivity for enhanced protection.'

  Scenario: Scenario 4: Case Insensitivity Check
    Given the user has registered with a password 'SecurePassword123'
    When the user enters 'SECUREpassword123' as the password
    Then the user should see an error message
    And the message should say 'Incorrect credentials. Please try again.'

  Scenario Outline: Scenario Outline: Login Attempts with Different Passwords
    Given the user has registered with a password '<stored-password>'
    When the user enters '<entered-password>' as the password
    Then the user should see '<expected-outcome>'
    Examples:
      | stored-password | entered-password | expected-outcome |
      | SecurePassword123 | SecurePassword123 | granted access |
      | SecurePassword123 | securepassword123 | error message |
      | SecurePassword123 | SECUREPASSWORD123 | error message |

