Feature: Unlock New Spells, Equipment and Outfits

  As a game player
  I want to unlock new spells, equipment, and outfits based on my achievements and progress
  So that I can access enhanced gameplay options and customize my character dynamically

  Background:
    Given the player has a base set of spells, equipment, and outfits available
    And the system continuously monitors the player's progress and achievements

  Scenario: Unlock new spells upon reaching specific level or quest completion
    Given the player reaches a specific level or completes the designated quest
    When the player accesses the spell inventory
    Then new spells are unlocked and become available for use
    And the player is notified of the newly unlocked spells

  Scenario: Unlock new equipment after collecting required materials or achieving milestone
    Given the player collects all required materials or achieves milestone X
    When the player visits the equipment shop or inventory
    Then new equipment items are unlocked and can be equipped by the player
    And the player receives confirmation of unlocked equipment

  Scenario: Unlock new outfits by earning points or completing special challenges
    Given the player earns enough points or successfully completes special challenges
    When the player opens the outfit selection screen
    Then new outfits become available for selection and use
    And the player is informed about the unlocked outfits

  Scenario: Only base/default items remain accessible when no unlock conditions are met
    Given the player does not meet any unlocking criteria for spells, equipment, or outfits
    When the player attempts to use spells, equipment, or outfits
    Then only base/default spells, equipment, and outfits remain accessible
    And any attempt to use locked spells triggers notification 'spell must be unlocked first'
    And any attempt to use locked equipment triggers notification 'equipment must be unlocked first'
    And any attempt to use locked outfit triggers notification 'outfit must be unlocked first'

  Scenario: Notify player when attempting to use locked items
    Given the player attempts to use a locked spell
    When the player uses the locked spell
    Then notify the player that the spell must be unlocked first

  Scenario: Notify player when attempting to use locked equipment
    Given the player attempts to use locked equipment item
    When the player uses the locked equipment
    Then notify the player that the equipment must be unlocked first

  Scenario: Notify player when attempting to use locked outfit
    Given the player attempts to use locked outfit
    When the player uses the locked outfit
    Then notify the player that the outfit must be unlocked first

  Scenario: System dynamically monitors player progress and updates unlock statuses
    Given the system continuously monitors the player's progress
    When the player meets unlock conditions for spells, equipment, or outfits
    Then the system dynamically updates unlock statuses accordingly

  Scenario Outline: Dynamic updating of unlock statuses based on player progress
    Given the player has a progress status of <progressStatus>
    And the player meets <conditionDescription>
    When <triggerEvent>
    Then the following items are unlocked: <unlockedItems>
    And the player is notified with message: <notification>
    Examples:
      | progressStatus | conditionDescription | triggerEvent | unlockedItems | notification |
      | Reached level 15 | the player has completed the level 15 milestone | the player opens the spell inventory | Fireball Spell, Ice Shield Spell | Congrats! New spells unlocked: Fireball Spell, Ice Shield Spell. |
      | Collected all materials for Thunder Sword | the player has all materials required for Thunder Sword | the player accesses the equipment inventory | Thunder Sword | Well done! Thunder Sword equipment is now available. |
      | Earned 8000 points | the player has surpassed 8000 points threshold | the player opens the outfits menu | Golden Armor Outfit | New outfit unlocked: Golden Armor Outfit. Enjoy customizing! |

