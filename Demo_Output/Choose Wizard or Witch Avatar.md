Feature: Choose Wizard or Witch Avatar

  As a player
  I want to select either the Wizard or Witch avatar with appropriate traits assigned
  So that I have the correct character appearance and abilities for gameplay and a clear avatar selection process

  Background:
    Given the game system is ready for avatar selection
    And no avatar has been selected yet

  Scenario: Selecting the Wizard avatar assigns wizard traits
    Given the player has not selected any avatar
    When the player selects the Wizard avatar
    Then the system assigns character appearance and abilities that reflect traditional wizard traits including robes, a staff, and spellcasting skills
    And the Wizard avatar is marked as selected

  Scenario: Selecting the Witch avatar assigns witch traits
    Given the player has not selected any avatar
    When the player selects the Witch avatar
    Then the system assigns character appearance and abilities that reflect traditional witch traits including a pointed hat, broomstick, and potion crafting
    And the Witch avatar is marked as selected

  Scenario: Selecting an avatar updates selection if another avatar was previously selected
    Given the Wizard avatar is currently selected with its traits assigned
    When the player selects the Witch avatar
    Then the system removes traits associated with the previously selected avatar (Wizard)
    And the system updates the avatar selection to the newly chosen Witch avatar
    And the Witch avatar is marked as selected

  Scenario: Prompting the player when no avatar is selected and trying to proceed
    Given the player has not selected any avatar
    When the player attempts to proceed to gameplay
    Then the system prompts the player with a message requesting that they choose either Wizard or Witch before continuing

  Scenario: Immediate display of avatar selection and prompts after user input
    Given the player inputs avatar selection or attempts to proceed
    When the player makes an input related to avatar selection or tries to proceed without selection
    Then the system immediately displays the selected avatar traits or prompt messages to ensure clarity before gameplay

  Scenario: Mutual exclusion between selecting Wizard and Witch avatars
    Given the player has made avatar selection inputs
    When the player selects the Wizard avatar
    Then the player cannot select the Witch avatar simultaneously
    And the system enforces that only one avatar can be selected at any time

  Scenario: At least one avatar selection must be made before proceeding
    Given the game is ready to accept avatar selections
    When the player inputs avatar selection
    Then the system requires that either the Wizard or Witch avatar is selected

  Scenario: Display all avatar selections and prompts immediately after user input
    Given the player has selected an avatar or attempted to proceed
    When the player makes a selection or tries to proceed
    Then the system displays all avatar selections and prompts immediately to the player
