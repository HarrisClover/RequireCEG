Feature: Allow Users to Specify Limits for Random Numbers

  As a user
  I want to set minimum and maximum limits for random number generation
  So that I can generate random numbers within desired ranges

  Background:
    Given the system is ready to accept limit inputs
    And the user has access to the random number generator

  Scenario: Valid Limits Provided
    Given the user inputs minimum limit as 1
    And the user inputs maximum limit as 100
    When the user requests a random number
    Then the system generates a random number between 1 and 100
    And the user receives the generated number

  Scenario: Maximum Limit Less Than Minimum Limit
    Given the user inputs minimum limit as 100
    When the user inputs maximum limit as 50
    Then the system presents an error message
    And the message states 'Invalid limits: Maximum limit must be greater than or equal to minimum limit.'

  Scenario: No Limits Provided
    Given the user does not provide any limits
    When the user requests a random number
    Then the system generates a random number between 1 and 100
    And the user receives the generated number

  Scenario: Non-Integer Limits
    Given the user inputs minimum limit as 'ten'
    And the user inputs maximum limit as 'twenty'
    When the user requests a random number
    Then the system presents an error message
    And the message states 'Please enter valid integer limits.'

  Scenario: Both Limits Provided and Valid
    Given the user inputs minimum limit as 10
    And the user inputs maximum limit as 20
    When the user requests a random number
    Then the system generates a random number between 10 and 20
    And the user receives the generated number

  Scenario: Minimum Limit Equals Maximum Limit
    Given the user inputs minimum limit as 30
    And the user inputs maximum limit as 30
    When the user requests a random number
    Then the system generates the number 30
    And the user receives the generated number
