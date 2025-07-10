Feature: Leveling up Character Skills and Abilities

  As a player
  I want the system to increment my character's skill levels and unlock abilities as experience is gained
  So that my character improves appropriately and I receive timely updates on new skills or restrictions based on skill levels

  Background:
    Given a character with defined skill categories and thresholds for skill levels
    And the system is tracking experience points and equipped skills

  Scenario: Gain experience and increase overall skill level
    Given a character with an initial skill level and experience points
    And the character has selected a skill category focus
    When the character gains experience points from completing quests or defeating enemies
    Then the character's overall skill level increases accordingly
    And experience points are allocated to the selected skill category to improve related abilities faster

  Scenario: Unlock enhanced abilities on reaching skill thresholds
    Given a character's skill level is just below a predefined threshold
    When the character gains enough experience points to reach or surpass that threshold
    Then the system unlocks enhanced abilities or spells associated with that threshold
    And the player is notified with a message about the new skills or ability upgrades available

  Scenario: Prevent usage of abilities below required skill level
    Given a character with a skill level below the required level for a specific ability or spell
    When the character attempts to use that ability or spell
    Then the system prevents the usage of the spell or ability
    And displays a warning message informing the player their skill level is insufficient

  Scenario: Continuous tracking and updating of experience and skill levels
    Given a character with <initial_experience> experience points and skill level <initial_skill_level>
    And experience thresholds for skill upgrades are set
    When the character gains <gained_experience> experience points from <source>
    Then the character's total experience points update to <updated_experience>
    And the skill level updates to <updated_skill_level>
    And any unlocked abilities at that level are made available

  Scenario: Continuously track and update experience points and skill levels
    Given a character is earning experience points
    When the character gains experience through completing quests or defeating enemies
    Then the system continuously tracks and updates experience points and skill levels accordingly
