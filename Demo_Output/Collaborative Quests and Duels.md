Feature: Collaborative Quests and Duels

  As a player
  I want to participate in collaborative quests with my house team and engage in duels with other players
  So that I can solve magical challenges together, compete in duels, and earn rewards based on performance

  Background:
    Given players belong to the same house team
    And players are logged into the system

  Scenario: Allowing players in the same house team to participate together in collaborative quests
    Given players belong to the same house team
    When players join a collaborative quest
    Then allow players in the same house team to participate together in collaborative quests

  Scenario: Completing a collaborative quest and distributing rewards
    Given players are participating in a collaborative quest together
    When the players work together to complete the quest
    Then distribute house points and unique rewards to all participants based on their roles and contribution levels

  Scenario: Continuing the collaborative quest when a player leaves before completion
    Given a player has joined a collaborative quest
    When the player leaves the quest before it is completed
    Then continue the collaborative quest with the remaining active players
    And mark the leaving player as partially ineligible for the final reward distribution

  Scenario: Initiating a duel and sending a duel request
    Given a player initiates a duel against another player
    When the system sends a duel request to the selected opponent
    Then enter duel mode and send a duel request to the selected opponent

  Scenario: Entering duel mode and displaying duel interface upon acceptance
    Given a duel request is sent to a player
    And the selected opponent accepts the duel request
    When both players accept the duel request
    Then display current health, mana, and available spell options on the duel interface

  Scenario: Awarding experience and magical items to the winning player after duel conclusion
    Given a duel between two players has concluded
    When the duel ends with one player winning
    Then award the winning player experience points and magical items

  Scenario: Awarding reduced experience rewards to both players if the duel ends in a draw
    Given a duel between two players has concluded
    When the duel ends in a draw
    Then award both players a reduced experience reward for a draw

  Scenario: Marking a player partially ineligible for final rewards upon leaving collaborative quest
    Given a player leaves the collaborative quest before completion
    When the player leaves the quest
    Then mark the leaving player as partially ineligible for the final reward distribution

  Scenario: Continuing collaborative quest with remaining active players when a player leaves
    Given a player leaves the collaborative quest before completion
    When the player leaves the quest
    Then continue the collaborative quest with the remaining active players
