Feature: Provide User Interface for Random Number Generation

  As a user
  I want to input minimum and maximum limits for random number generation
  So that I can generate a random number within my specified range

  Background:
    Given the system is initialized
    And the user is prompted to enter a minimum and maximum limit

  Scenario: User provides valid limits
    Given the user enters a minimum limit of 1
    And the user enters a maximum limit of 10
    When the user requests a random number
    Then the system generates a random number within the range 1 to 10
    And the generated number is displayed

  Scenario: User fails to provide limits
    Given the user does not enter any limits
    When the user requests a random number
    Then the system displays the message 'Please enter valid minimum and maximum values.'

  Scenario: User enters invalid limits
    Given the user enters a minimum limit of 10
    And the user enters a maximum limit of 5
    When the user requests a random number
    Then the system displays the message 'Invalid limits provided. Maximum limit must be greater than minimum limit.'

  Scenario: User requests new random number with same limits
    Given the user has set the limits to 1 and 5
    When the user requests a random number
    Then the system generates a random number within the range 1 to 5
    And the generated number is displayed

  Scenario: User modifies limits
    Given the user has set the limits to 1 and 10
    When the user updates the minimum limit to 5
    And the user updates the maximum limit to 15
    Then the system accepts the new limits
    And the system generates a random number within the range 5 to 15
    And the generated number is displayed

  Scenario: User modifies limits to same values
    Given the user has set the limits to 1 and 10
    When the user updates the minimum limit to 10
    And the user updates the maximum limit to 10
    Then the system displays a message that limits cannot be the same
