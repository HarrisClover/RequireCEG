Feature: Intuitive HUD and Menus

  As a player
  I want the system to display context-sensitive HUD and menus according to the current mode
  So that I can receive relevant information and navigate the interface easily without disrupting gameplay

  Background:
    Given the player is in the game
    And the system is ready to respond to mode changes and menu interactions

  Scenario: Display minimal HUD in exploration mode
    Given the player is in exploration mode
    When the system displays the HUD
    Then the HUD shows the player's health, magic power, and current spell indicators
    And the indicators are positioned unobtrusively on the screen

  Scenario: Display sorted inventory menu with tooltips
    Given the player opens the inventory menu
    When the system displays the inventory
    Then all inventory items are displayed sorted by their type category
    And each item shows a distinct icon with a descriptive tooltip

  Scenario: Switch HUD to duel mode layout
    Given the player enters duel mode
    When the HUD updates
    Then the HUD shows the opponent's health bar
    And the player's available spells are displayed with real-time health and spell cooldown updates

  Scenario: Display settings menu with organized options and multi-input support
    Given the player accesses the settings menu
    When the system presents the settings interface
    Then the options are organized under sound, controls, and display categories
    And the interface enables easy navigation and selection via keyboard, mouse, or controller

  Scenario: Show quest update notification non-intrusively
    Given the player receives a quest update
    When the system displays a notification
    Then a brief, non-intrusive HUD notification is shown
    And the notification conveys the update clearly without interrupting or blocking gameplay
