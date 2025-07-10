Feature: Opt-in Reward Program

  As a website user
  I want to opt into the reward program
  So that I can receive enticing rewards based on my engagement level

  Background:
    Given a user wants to use the website
    And the user can choose to opt into the reward program

  Scenario: Scenario 1: User opts in and uses the website
    Given the user opts into the reward program
    And the user is actively engaging with the website
    When the user completes activities on the website
    Then the system displays rewards based on the user's engagement level
    And the user starts receiving rewards

  Scenario: Scenario 2: User opts out of rewards
    Given the user opts into the reward program
    And the user explicitly opts out of receiving rewards
    When the user engages with the website
    Then the system does not allocate any rewards

  Scenario: Scenario 3: User does not use the website
    Given the user opts into the reward program
    And the user does not use the website
    When the user performs no engagement actions
    Then the system ensures that the user does not receive any rewards

  Scenario: Scenario 4: User opts in and is not actively engaged
    Given the user opts into the reward program
    And the user is not actively engaged in the reward program
    When the user engages with the website while not being active in the reward program
    Then the system ensures that only actively engaged users receive tiered rewards

  Scenario: Scenario 5: User opts out while using the website
    Given the user opts out of receiving rewards
    And the user is currently using the website
    When the user engages with the website
    Then the system prevents reward allocation for the user who opted out but is using the website

  Scenario Outline: Scenario Outline: Tiered rewards based on engagement
    Given the user opts into the reward program with an engagement level of '<engagement-level>'
    And the system has defined rewards for '<reward-tier>' tier
    When the user engages with the system for '<duration>'
    Then the system displays rewards from the '<reward-tier>' tier
    Examples:
      | engagement-level | reward-tier | duration |
      | high | gold | 30 days |
      | medium | silver | 15 days |
      | low | bronze | 7 days |

