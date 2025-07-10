Feature: Reward Redeem Instructions

  As a user
  I want to opt for using the website for rewards
  So that I can take advantage of tempting offers

  Background:
    Given the user has the option to choose whether to use the website
    And the user understands the rewards system

  Scenario: Scenario 1: User opts to use the website and desires rewards
    Given the user decides to use the website
    And the user expresses a desire to receive rewards
    When the system processes the user's choice
    Then the system displays a list of tempting offers
    And the user receives details about available rewards

  Scenario: Scenario 2: User opts to use the website but declines rewards
    Given the user decides to use the website
    When the user explicitly states that they do not wish to receive any rewards
    Then the system does not show any tempting offers

  Scenario: Scenario 3: User decides not to use the website
    Given the user chooses not to use the website
    Then the user does not receive any rewards or tempting offers

  Scenario: Scenario 4: User chooses to use the website but does not wish to receive rewards
    Given the user decides to use the website
    And the user does not express a desire to receive rewards
    Then the system does not show any tempting offers
    And the user will not receive any rewards

  Scenario: Scenario 5: User decides not to use the website but does express desire for rewards
    Given the user decides not to use the website
    Then the user does not receive any rewards or tempting offers
