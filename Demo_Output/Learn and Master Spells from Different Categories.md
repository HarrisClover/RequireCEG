Feature: Learn and Master Spells from Different Categories

  As a player
  I want to view and manage spells within selected spell categories, learning and mastering spells according to level and prerequisites
  So that I can enhance my gameplay by acquiring and improving spells relevant to my current category and skill

  Background:
    Given the game has multiple spell categories each containing different spells
    And the player has a character with a certain level and a list of known spells

  Scenario: Display all spells in the selected category
    Given the player has selected a spell category
    When the game displays spells for the selected category
    Then the list shows only the spells available within that selected category

  Scenario: Learn a spell when prerequisites and player level are met
    Given the player has selected a spell category
    And the player meets the required level for a specific spell
    And the player meets the prerequisite conditions for that spell
    When the player attempts to learn that spell
    Then the spell is added to the player's known spells list

  Scenario: Prevent learning a spell if level or prerequisites are not met
    Given the player has selected a spell category
    And the player does not meet the required level or prerequisite conditions for a specific spell
    When the player attempts to learn that spell
    Then the spell is not added to the known spells list
    And the player is notified of the unmet conditions

  Scenario: Prevent mastering a spell that has not been learned
    Given the player has selected a spell category
    And the player has not learned the particular spell
    When the player attempts to master the spell
    Then the mastery progression is prevented
    And the player is prompted to learn the spell first

  Scenario: Increase spell power upon successful mastery
    Given the player has learned a spell in the selected category
    When the player masters the spell to a new mastery level
    Then the spell's power or effectiveness is increased proportionally based on the mastery level achieved

  Scenario: Restrict spells to those within the currently selected category
    Given the player has selected a spell category
    When the player switches to a different spell category
    Then only spells relevant to the currently selected category are available for learning and mastering
    And learning and mastering actions apply only to spells within the chosen category
