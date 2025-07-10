Feature: Interact with Magical Creatures

  As a player
  I want to interact appropriately with various magical creatures based on specific actions
  So that I receive correct feedback, assistance, or consequences during my adventure

  Background:
    Given the player is in a magical environment
    And the system processes only one interaction at a time

  Scenario: Riding a Hippogriff after Respectful Bow
    Given a Hippogriff is nearby
    And the player is present
    When the player bows to the Hippogriff
    Then the Hippogriff allows the player to ride it
    And the system triggers an appropriate message and animation

  Scenario: Niffler Runs Away when Untouched without Shiny Object
    Given a Niffler is nearby
    When the player attempts to touch the Niffler while not holding any shiny object
    Then the Niffler runs away immediately
    And the system triggers an appropriate message and animation

  Scenario: Bowtruckle Becomes Friendly and Assists After Offered Food
    Given a Bowtruckle is nearby
    When the player offers food to the Bowtruckle
    Then the Bowtruckle becomes friendly
    And the Bowtruckle assists the player in locating hidden objects
    And the system triggers an appropriate message and animation

  Scenario: Magical Creature Becomes Frightened and Flees When Incorrect Spell Cast
    Given a Magical Creature is nearby
    And the player has a spell
    When the player casts an incorrect spell near the Magical Creature
    Then the Magical Creature becomes frightened and flees the area
    And the system triggers an appropriate message and animation

  Scenario: Magical Creature Performs Unique Aid When Correct Spell Cast
    Given a Magical Creature is nearby
    And the player has a spell
    When the player casts the correct spell near the Magical Creature
    Then the Magical Creature performs a unique action aiding the player
    And the system triggers an appropriate message and animation

  Scenario: System Rejects Simultaneous or Conflicting Actions
    Given the player attempts multiple interactions simultaneously
    When conflicting or simultaneous actions are performed
    Then the system processes only one interaction based on the player's specific action and creature type
    And other interactions are ignored
    And the system triggers an appropriate message indicating the conflict

  Scenario: System Prevents Processing of Simultaneous or Conflicting Actions When Interaction Is Active
    Given another interaction is currently being processed
    When the player tries to initiate a new interaction
    Then the system prevents processing the new interaction
    And the system triggers an appropriate message indicating that simultaneous or conflicting actions are not allowed

  Scenario: System Triggers Interaction Response Messages and Animations
    Given an interaction response action is triggered (e.g., E1, E2, E3, E4, E5, or E6)
    When the relevant creature interaction occurs
    Then the system triggers appropriate messages and animations corresponding to the response

  Scenario Outline: Casting Spell Near Magical Creature
    Given a Magical Creature is nearby
    And the player has a spell
    When the player casts the <spell-correctness> spell near the Magical Creature
    Then the creature <creature-response>
    And the system triggers an appropriate message and animation
    Examples:
      | spell-correctness | creature-response |
      | incorrect | becomes frightened and flees the area |
      | correct | performs a unique action aiding the player |

