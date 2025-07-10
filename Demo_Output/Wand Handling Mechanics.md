Feature: Wand Handling Mechanics

  As a player
  I want to perform specific wand gestures that trigger different spells and effects
  So that I can control my character's spellcasting effectively and experience immersive gameplay

  Background:
    Given the wand gesture recognition system is active
    And the character is ready to cast spells

  Scenario: Casting a medium power spell with an upward wand swipe without charge mode
    Given the player holds the wand
    And the system is tracking wand movements
    And the player is not in charge mode
    When the player swipes the wand upwards
    Then the system registers a medium power spell cast
    And the character performs the medium power spell animation and effects

  Scenario: Initiating a defensive shield with a downward wand swipe without charge mode
    Given the player holds the wand
    And the player is not in charge mode
    When the player swipes the wand downwards
    Then the system initiates a defensive shield spell
    And the character gains a shield that protects from damage

  Scenario: Triggering a powerful area-of-effect spell with a circular wand motion without charge mode
    Given the player holds the wand
    And the player is not in charge mode
    When the player performs a circular wand movement
    Then the system triggers a powerful AoE spell
    And the character casts the area-of-effect spell with visual and audio feedback

  Scenario: Entering charge mode after holding wand steady for more than 3 seconds
    Given the player holds the wand steady
    And the steady hold duration exceeds 3 seconds
    When the player holds the wand steady for more than 3 seconds
    Then the system enters charge mode
    And the system flags the next spell cast as a critical hit

  Scenario: Casting a critical hit medium power spell after charge mode activation with an upward wand swipe
    Given the player has entered charge mode after holding the wand steady for more than 3 seconds
    When the player swipes the wand upwards
    Then the system triggers a critical hit medium power spell
    And the character performs the critical hit medium power spell animation and effects

  Scenario: Triggering a magic backfire for an undefined wand movement
    Given the player performs a wand movement
    When the movement does not match up swipe, down swipe, circular motion, or steady hold
    Then the system triggers a magic backfire
    And the character is temporarily stunned
    And appropriate visual and audio feedback for the backfire is shown

  Scenario: Tracking wand movements continuously without changing spellcast outcomes
    Given the system is continuously tracking wand gestures
    When the player performs any wand gesture
    Then the system tracks timing and pattern of wand movements continuously

  Scenario: Triggering a magic backfire after a rare undefined swipe movement following charge mode activation
    Given the player performs a wand movement
    And the movement does not match known defined gestures
    When the player performs an undefined swipe movement
    Then the system triggers a magic backfire
    And the character is temporarily stunned
    And appropriate visual and audio feedback for the backfire is shown

  Scenario Outline: Continuous detection and differentiation of wand gestures
    Examples:
      | something | number | thing | event | outcome |
      | the system is continuously tracking wand gestures | 1 | wand gesture | the gestures are up swipe | a single medium power spell is cast with feedback |
      | the system is continuously tracking wand gestures | 2 | wand gestures | the gestures are up swipe, down swipe | medium power spell cast followed by shield activation |
      | the system is continuously tracking wand gestures | 3 | wand gestures | the gestures are circular motion, steady hold (4s), up swipe | AoE spell cast, charge mode activated, critical hit medium spell cast |
      | the system is continuously tracking wand gestures | 1 | wand gesture | the gestures are random zigzag movement | magic backfire with stun and feedback |
      | the system is continuously tracking wand gestures | 4 | wand gestures | the gestures are steady hold (5s), down swipe, circular motion, undefined swipe | charge mode activated, shield activated, AoE spell cast, magic backfire with stun |

