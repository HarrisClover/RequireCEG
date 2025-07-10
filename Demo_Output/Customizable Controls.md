Feature: Customizable Controls

  As a player
  I want to customize control mappings for spell casting, movement, and item usage based on my selected control scheme
  So that I can have an immersive and personalized gameplay experience with valid and functional input configurations

  Background:
    Given the game supports keyboard and gamepad control schemes
    And there are predefined default key and button mappings based on Harry Potter themed gameplay

  Scenario: Enable key mapping for keyboard control scheme
    Given the player selects the keyboard control scheme
    When the player maps spell casting, movement, and item usage actions to chosen keys
    Then the game validates the new key mappings for uniqueness and functionality
    And the game enables the configured key mappings immediately after validation
    And the game applies the new validated key mappings

  Scenario: Enable button mapping for gamepad control scheme
    Given the player selects the gamepad control scheme
    When the player remaps spell casting, movement, and item usage actions to preferred buttons
    Then the game validates the new button mappings for uniqueness and functionality
    And the game enables the configured button mappings immediately after validation
    And the game applies the new validated button mappings

  Scenario: Reset controls to default mappings
    Given the player has customized any control mappings
    When the player chooses to reset controls to default
    Then the game restores the original predefined key and button mappings associated with the Harry Potter themed gameplay immediately
    And the restored default mappings are applied without delay

  Scenario: Invalid control mapping attempt due to duplicate inputs
    Given the player attempts to map multiple actions to the same key or button
    When the player applies the control mapping changes
    Then the game detects duplicate input conflicts in the mappings
    And the game displays an appropriate error message indicating mapping conflicts
    And the invalid mappings are not applied

  Scenario: Invalid control mapping attempt due to non-functional inputs
    Given the player attempts to map an action to a non-functional or unsupported key or button
    When the player applies the control mapping changes
    Then the game detects invalid or unsupported inputs in the mappings
    And the game displays an appropriate error message indicating invalid inputs
    And the invalid mappings are not applied

  Scenario: Apply and validate new control mappings
    Given the player changes any control settings
    And the new control mappings are validated for uniqueness and functionality
    When the player applies the control mapping changes
    Then the game applies the new control mappings
    And the game does not apply the mappings if validation fails

  Scenario: Display error message for invalid control mappings
    Given the new control mappings are invalid
    When the player applies the control mapping changes
    Then the game displays appropriate error messages for invalid mappings
    And the invalid mappings are not applied
