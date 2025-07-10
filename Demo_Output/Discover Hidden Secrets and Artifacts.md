Feature: Discover Hidden Secrets and Artifacts

  As a player exploring the magical world
  I want to discover hidden secrets and artifacts through specific actions and items
  So that I can uncover mysteries and gain rewards within the game environment

  Background:
    Given the player is within the Hogwarts environment
    And the system tracks the player's current items and actions

  Scenario: Reveal hidden artifact by exploring the Forbidden Forest and casting the required spell
    Given the player explores the Forbidden Forest
    And the player correctly casts the required spell
    And only one secret can be discovered at a given time
    And player's current actions and items held prioritize which secret to reveal
    When these conditions are met simultaneously
    Then the system reveals a hidden artifact
    And a message is displayed to the player about the revealed artifact

  Scenario: Unlock secret passage by solving riddle in the Room of Requirement with specific magical item
    Given the player is in the Room of Requirement
    And the player carries the required specific magical item
    And only one secret can be discovered at a given time
    And player's current actions and items held prioritize which secret to reveal
    When the player solves the riddle correctly
    Then the system unlocks a secret passage containing ancient secrets
    And a message is displayed to the player about the unlocked secret passage

  Scenario: Unlock hidden chamber after collecting three unique clues from different classrooms
    Given the player has collected three unique clues from different Hogwarts classrooms
    And only one secret can be discovered at a given time
    And player's current actions and items held prioritize which secret to reveal
    When the collection is complete
    Then the system unlocks a hidden chamber containing rare artifacts
    And a message is displayed to the player about the unlocked hidden chamber

  Scenario: Reveal hidden locations by using the Marauder's Map during allowed times
    Given the player holds the Marauder's Map
    And the current time is within the allowed usage times
    And only one secret can be discovered at a given time
    And player's current actions and items held prioritize which secret to reveal
    When the player uses the Marauder's Map
    Then the system reveals hidden locations with secrets
    And a message is displayed to the player about the revealed hidden locations

  Scenario: System displays message guiding the player about the secret revealed or unlocked
    Given any one of the secrets (hidden artifact, secret passage, hidden chamber, or hidden locations) is revealed or unlocked
    When the system reveals or unlocks the secret
    Then the system displays a message guiding the player about the revealed or unlocked secret

  Scenario Outline: System reveals only one secret at a time prioritizing first applicable condition
    Given the player is performing actions and holding items: <action>
    And the system checks the secret discovery conditions in priority order
    And only one secret can be discovered at a given time
    When multiple conditions are met simultaneously
    Then the system reveals only the <priority> secret
    And the system displays a message guiding the player about the revealed secret
    Examples:
      | action | priority |
      | exploring the Forbidden Forest and casting the required spell | hidden artifact |
      | solving riddle in the Room of Requirement with specific magical item | secret passage |
      | collecting three unique clues from different Hogwarts classrooms | hidden chamber |
      | using the Marauder's Map during allowed times | hidden locations |

