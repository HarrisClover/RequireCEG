Feature: Reward Eligibility Assessment

  As a user of the website
  I want to determine my eligibility for rewards
  So that I can understand if I qualify for tempting rewards

  Background:
    Given the user expresses a wish to use the website
    And the user indicates whether they wish to receive rewards

  Scenario: Scenario 1: User wants to use the website and to receive rewards
    Given the user wants to use the website
    And the user desires to receive rewards
    When the system checks the user's preferences
    Then the user is eligible for rewards
    And the system allows rewards allocation

  Scenario: Scenario 2: User wants to use the website but opts out of rewards
    Given the user wants to use the website
    When the user states they do not wish to receive rewards
    Then the system prints the message 'You are ineligible for rewards as you have opted out of rewards.'

  Scenario: Scenario 3: User does not want to use the website
    Given the user does not want to use the website
    When the user provides their preference
    Then the system prints the message 'You are not eligible for rewards since you chose not to use the website.'

  Scenario: Scenario 4: User wants to use the website but wants to receive rewards
    Given the user indicates a desire to use the website
    And the user expresses a wish to receive rewards
    When the system evaluates user preferences
    Then the system should confirm that the user is eligible for rewards
    And the system allows rewards allocation

  Scenario: Scenario 5: User wants to use the website and opts out of receiving rewards
    Given the user wants to use the website
    When the user states they do not wish to receive rewards
    Then the system should print the message 'You are ineligible for rewards as you have opted out of rewards.'

  Scenario Outline: Scenario Outline: User intent and reward preference assessment
    Given the user indicates a desire to use the website as <user-wants>
    And the user states their reward preference as <reward-preference>
    When the system assesses eligibility
    Then the system should output <outcome>
    Examples:
      | user-wants | reward-preference | outcome |
      | true | true | eligible for rewards |
      | true | false | ineligible for rewards as opted out |
      | false | true | not eligible for rewards as chose not to use the website |
      | false | false | not eligible for rewards as chose not to use the website |

