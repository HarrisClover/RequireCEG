Feature: Error Handling for Reward Distribution

  As a website user
  I want to receive or opt out of rewards based on my intention
  So that I have control over the rewards I can receive and avoid confusion

  Background:
    Given a user visits the website
    And the system is ready to manage rewards

  Scenario: User opts in to receive rewards
    Given the user indicates a desire to use the website
    And the user expresses interest in receiving tempting rewards
    When the user confirms their interest
    Then the system grants access to rewards
    And displays a confirmation message indicating that rewards have been successfully opted for

  Scenario: User opts out of receiving rewards
    Given the user chooses to use the website but does not wish to receive any rewards
    When the user confirms their choice to opt out
    Then the system refrains from distributing rewards
    And does not show a rewards confirmation

  Scenario: User shows no interest in website usage
    Given the user expresses no interest in using the website
    When the user tries to access rewards
    Then the system prevents access to rewards
    And displays a rejection message stating that rewards are unavailable without website usage

  Scenario: User attempts to claim rewards without intent
    Given the user attempts to claim rewards without a valid intention
    When the claim for rewards is submitted
    Then the system presents an error message clarifying their selection
    And informs the user that rewards cannot be claimed without expressing intent to receive them

  Scenario: User mistakenly opts for rewards without expressing intent
    Given the user indicates a desire to use the website
    When the user attempts to claim rewards but does not express intent
    Then the system presents an error message clarifying their selection
    And informs the user that rewards cannot be claimed without expressing intent to receive them
