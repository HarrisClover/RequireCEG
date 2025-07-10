Feature: Complete Quests and Missions

  As a Hogwarts player
  I want to accept quests from professors and complete all objectives successfully
  So that I can earn rewards, gain house points, unlock new story arcs, and progress through missions

  Background:
    Given the player has access to the quest system
    And professors can assign quests to the player

  Scenario: Accepting a quest adds it to the active quest log and initializes quest status
    Given a quest is assigned by a Hogwarts professor
    When the player accepts the quest
    Then the quest is added to the player's active quest log
    And the quest status is initialized as 'active'

  Scenario: Completing all quest objectives changes status to completed and grants rewards
    Given the player has an active quest with all specified objectives
    When the player completes all objectives within the quest
    Then the quest status is changed to 'completed'
    And the system grants rewards including house points or magical items
    And the player's inventory is updated accordingly
    And the player's score is updated accordingly

  Scenario: Failing a quest due to time running out or incorrect decisions sets quest status to failed with penalties
    Given the player has an active quest
    When the player fails to complete all objectives within the allotted time or makes incorrect decisions violating quest conditions
    Then the quest status is set to 'failed'
    And the player is deducted house points or denied quest rewards
    And a failure message is presented to the player

  Scenario: Failing a dark creature quest by not casting learned spells triggers a prompt and prevents completion
    Given the player is undertaking a quest involving defeating a dark creature
    And the player has learned spells required for combat
    When the player fails to successfully cast the necessary spells during combat sequences
    Then the quest status is not changed to 'completed'
    And a prompt indicates the necessary spell usage to the player

  Scenario Outline: Progressing through missions unlocks special story arcs with new content and rewards
    Given the player has completed a sequence of missions in the prescribed order
    And there are <number> missions completed consecutively
    When the system tracks the mission progression
    Then a special story arc is unlocked with increased difficulty
    And new quest content is enabled
    And new reward parameters are enabled
    Examples:
      | number |
      | 3 |
      | 5 |
      | 7 |

