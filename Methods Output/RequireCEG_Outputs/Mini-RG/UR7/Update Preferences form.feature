Feature: Update Preferences form

  As a user
  I want to receive rewards for engaging with the website
  So that I can enjoy benefits while shopping

  Background:
    Given the user is on the website
    And the user has preferences regarding rewards

  Scenario: User wants to receive rewards and is using the website
    Given the user expresses desire to use the website
    And the user desires to receive tempting rewards
    When the system processes the user's preferences
    Then the user receives the rewards
    And the rewards are applied to their account

  Scenario: User wants to use the website but opts out of rewards
    Given the user expresses desire to use the website
    And the user explicitly opts out of receiving rewards
    When the system processes the user's preferences
    Then the user does not receive any rewards

  Scenario: User does not want to use the website
    Given the user does not express desire to use the website
    When the system checks the user's preferences
    Then the user does not receive any rewards

  Scenario: User wants rewards but does not wish to use the website
    Given the user desires to receive tempting rewards
    And the user does not express a desire to use the website
    When the system evaluates the user's preferences
    Then the system displays a message stating that rewards can only be earned while engaging with the website

  Scenario: User wishes to use the website but does not wish for rewards
    Given the user expresses desire to use the website
    And the user wishes to receive rewards but does not wish to use the website
    When the system processes the user's preferences
    Then the system displays a message stating that rewards can only be earned while engaging with the website
