Feature: Make Moral and Strategic Decisions

  As a player
  I want to make strategic or moral decisions in the game that affect available challenges, inventories, reputation, and alliances
  So that my choices meaningfully impact gameplay and story progression with dynamic consequences

  Background:
    Given the player is logged into the game
    And no other strategic or moral decisions are currently active

  Scenario: Support Gryffindor and enable bravery-based challenges
    Given the player chooses to support Gryffindor
    When the system processes the choice
    Then the system enables bravery-based challenges exclusive to Gryffindor supporters
    And the player's available challenge list is updated accordingly

  Scenario: Trust Snape during a key mission
    Given the player opts to trust Snape during a key mission
    When the system processes the trust decision
    Then the system grants access to the secret potions inventory
    And the system sets an internal flag indicating potential betrayal

  Scenario: Steal from a fellow student
    Given the player steals from a fellow student
    When the system recognizes the theft
    Then the system decreases the player's House points by a defined amount
    And the system reduces trust levels from allied characters
    And the system updates all related reputation metrics accordingly

  Scenario: Report a fellow student breaking rules
    Given the player reports another student for rule-breaking
    When the system initiates disciplinary actions
    Then the system initiates disciplinary actions against the reported character
    And the system decreases relationship scores with some characters, weakening player's alliances

  Scenario: Employ dark magic in a critical battle
    Given the player employs dark magic during a critical battle
    When the battle starts
    Then the system applies a temporary power boost effect for the duration of that battle
    And the system imposes a permanent reputation damage penalty visible in the player's standing summary

  Scenario: Enforce single active strategic or moral decision constraint
    Given a strategic or moral decision is currently active
    When the player attempts to make another strategic or moral decision while one is active
    Then the system displays a notification message indicating current choices must be resolved before proceeding

  Scenario: Mutually exclusive strategic or moral decisions
    Given the player attempts to make multiple strategic or moral decisions simultaneously
    When the system processes these decisions
    Then the system ensures that the player cannot select more than one strategic or moral decision at the same time

  Scenario: Require decision clearance before new decisions
    Given the player attempts to make a new strategic or moral decision
    And there is an active strategic or moral decision
    When the player tries to proceed with the new decision
    Then the system enforces that the new decision depends on resolution of the current active decision

  Scenario Outline: Dynamic impact on player standing based on decisions
    Given the player has made the strategic or moral decision "<decision>"
    When the decision consequence is applied
    Then the system dynamically updates the player's standing with Hogwarts Houses and characters in real time
    And the system dynamically updates reputation and alliance data with various characters in real time
    Examples:
      | decision | House Points Change | Relationship Change | Reputation Impact |
      | Support Gryffindor | + | no immediate change | positive in Gryffindor reputation |
      | Trust Snape | no change | no immediate change | flag set, potential future negative impact |
      | Steal from a fellow student | -50 | -20 with allies | negative reputation across multiple groups |
      | Report a fellow student | no change | -15 with some allies | mixed reputation changes |
      | Employ dark magic | temporary battle power boost | no immediate relation change | permanent negative reputation penalty |

