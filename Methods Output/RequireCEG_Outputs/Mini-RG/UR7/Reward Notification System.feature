Feature: Reward Notification System

  As a website user
  I want to receive notifications about tempting rewards
  So that I can choose to benefit from rewards while using the website

  Background:
    Given the user has indicated a desire to use the website
    And the reward notification system is active

  Scenario: Scenario 1: User opts for rewards
    Given the user wants to receive rewards
    When the user selects to receive the rewards
    Then the system issues the tempting rewards
    And the system displays a reward notification

  Scenario: Scenario 2: User declines rewards
    Given the user wants to use the website
    When the user declines the reward offer
    Then the system does not issue any rewards

  Scenario: Scenario 3: User does not express desire to use website
    Given the user does not indicate a desire to use the website
    When the user interacts with the website
    Then the reward functionality remains inactive

  Scenario: Scenario 4: User opts for rewards but does not show desire
    Given the user does not indicate a desire to use the website
    When the user selects to receive rewards
    Then the system keeps the reward functionality inactive
    And the system does not issue any rewards

  Scenario Outline: Scenario Outline: User Interaction with Rewards
    Given the user has indicated a desire to use the website as <user-desire>
    And the user selects <reward-decision>
    When the system checks the user's input
    Then the system <expected-outcome>
    Examples:
      | user-desire | reward-decision | expected-outcome |
      | desires to use | opts for rewards | issues rewards and displays notification |
      | desires to use | declines rewards | does not issue rewards |
      | does not desire | any decision | keeps reward functionality inactive |

