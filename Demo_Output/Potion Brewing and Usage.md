Feature: Potion Brewing and Usage

  As a player
  I want to brew potions with ingredient combinations and use them
  So that I can gain benefits like health restoration or attack power buff in the game

  Background:
    Given a predefined list of valid potion recipes
    And the player has an empty inventory

  Scenario: Successful potion creation from a valid recipe
    Given the player selects a combination of ingredients
    And the selected combination matches a predefined correct potion recipe
    When the system validates the ingredient combination
    Then the system creates a successful potion instance
    And adds the successful potion to the player's inventory

  Scenario: Failed potion creation from an invalid recipe
    Given the player selects a combination of ingredients
    And the selected combination does not match any valid recipe
    When the system validates the ingredient combination
    Then the system creates a failed potion instance with no beneficial effects
    And adds the failed potion to the player's inventory as a distinct potion type

  Scenario: Using a potion not present in the inventory
    Given the player attempts to use a potion
    And the specified potion type is not present in the player's inventory
    When the player tries to use the potion
    Then the system displays a message indicating the potion is unavailable

  Scenario: Using a healing potion from inventory
    Given the player attempts to use a potion
    And the specified potion type is present in the player's inventory
    And the potion type used is a healing potion
    When the player uses the healing potion
    Then the system increases the player's health by a fixed predefined amount
    And removes one instance of the healing potion from the inventory

  Scenario: Using a strength potion from inventory
    Given the player attempts to use a potion
    And the specified potion type is present in the player's inventory
    And the potion type used is a strength potion
    When the player uses the strength potion
    Then the system applies a temporary buff that increases the player’s attack power for a limited time duration
    And removes one instance of the strength potion from the inventory

  Scenario: Potion usage requires potion type to be in inventory
    Given the player attempts to use a healing potion
    When the player tries to use the healing potion
    Then the system requires that the healing potion is present in the inventory

  Scenario: Potion usage requires potion type to be in inventory
    Given the player attempts to use a strength potion
    When the player tries to use the strength potion
    Then the system requires that the strength potion is present in the inventory

  Scenario: Healing and strength potions cannot be used simultaneously
    Given the player attempts to use multiple potions
    When the player tries to use a healing potion and a strength potion at the same time
    Then the system prevents the simultaneous usage of healing and strength potions

  Scenario: Failed and successful potion creation are mutually exclusive
    Given the player selects a combination of ingredients
    When the system validates the ingredient combination
    Then the system creates either a successful potion or a failed potion but not both
