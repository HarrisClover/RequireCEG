Feature: Input Profile Information

  As a user
  I want to create my profile
  So that I can access the system features

  Background:
    Given the user has a valid username and password
    And the required profile fields are completed

  Scenario: Scenario 1: Successful Profile Creation
    Given the user inputs their profile information correctly
    When the user submits the profile creation form
    Then the user receives a confirmation message 'Your profile has been created successfully.'
    And the profile will be created successfully.

  Scenario: Scenario 2: Incomplete Profile Information
    Given the user has not completed all required fields
    When the user submits the profile creation form
    Then the user receives an error message 'All required fields must be completed.'
    And the profile is not created

  Scenario: Scenario 3: Incorrect Username
    Given the user enters a username that is not valid
    And the password is correct
    When the user attempts to create the profile
    Then the user receives an error message 'Invalid username or password.'
    And the profile is not created

  Scenario: Scenario 4: Incorrect Password
    Given the user enters a valid username
    And the password is not correct
    When the user attempts to create the profile
    Then the user receives an error message 'Invalid username or password.'
    And the profile is not created

  Scenario Outline: Scenario Outline: Profile Creation with Invalid Credentials
    Given the user enters a username as '<username>'
    And a password as '<password>'
    When the user attempts to create the profile
    Then the user receives an error message '<errorMessage>'
    Examples:
      | username | password | errorMessage |
      | invalidUser | validPassword | Invalid username or password |
      | validUser | invalidPassword | Invalid username or password |
      | invalidUser | invalidPassword | Invalid username or password |

