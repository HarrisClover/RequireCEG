Feature: Tempting Rewards

  As a website user
  I want to receive tempting rewards
  So that I have a reason to use the website

  Background:
    Given the user is logged into the website
    And the user is presented with reward options

  Scenario: Scenario 1: User opts for rewards
    Given the user wants to use the website
    When the user selects a reward from the available options displayed
    Then the user should receive the chosen reward and see a confirmation message
    And the rewards program should update the user's status

  Scenario: Scenario 2: User does not want rewards
    Given the user wants to use the website
    When the user declines the reward options presented
    Then the user should not receive any rewards and see a message confirming their choice

  Scenario: Scenario 3: User wants rewards but opts out
    Given the user wants to use the website
    When the user opts out of the rewards program intentionally
    Then the user should not be eligible for any rewards and see a notification about the opt-out status
