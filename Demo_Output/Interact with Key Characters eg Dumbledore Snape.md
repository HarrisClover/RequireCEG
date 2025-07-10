Feature: Interact with Key Characters (e.g., Dumbledore, Snape)

  As a player in the game
  I want to interact with key characters and receive appropriate responses and challenges
  So that I can progress through the quest with meaningful guidance, challenges, and rewards

  Background:
    Given the player has access to key characters Dumbledore and Snape
    And the system tracks prior task completion states for each character

  Scenario: Interact with Dumbledore
    Given the player chooses to interact with Dumbledore
    When the interaction is initiated
    Then the system provides wisdom and clues relevant to the player's current quest
    And the player is informed of the next required action to maintain narrative flow

  Scenario: Interact with Snape
    Given the player chooses to interact with Snape
    When the interaction is initiated
    Then the system prompts the player to either answer a riddle or complete a potion-making challenge before proceeding
    And the player is clearly informed about the nature of the challenge

  Scenario: Interact with key character after completing prior task triggers unique dialogue and rewards
    Given the player has completed a prior task associated with Dumbledore
    And Dumbledore is a key character
    When the player interacts with Dumbledore
    Then the system triggers a unique dialogue specific to Dumbledore
    And the system rewards the player accordingly

  Scenario: Interact with key character after completing prior task triggers unique dialogue and rewards
    Given the player has completed a prior task associated with Snape
    And Snape is a key character
    When the player interacts with Snape
    Then the system triggers a unique dialogue specific to Snape
    And the system rewards the player accordingly

  Scenario: Verify prior task completion state before presenting unique dialogue and rewards
    Given the player interacts with any key character (Dumbledore or Snape)
    And the player has completed a prior task associated with the character
    When interaction is initiated
    Then the system verifies the completion state of prior tasks
    And the system presents unique dialogue and rewards accordingly
