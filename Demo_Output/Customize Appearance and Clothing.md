Feature: Customize Appearance and Clothing

  As a player customizing a character
  I want the system to automatically filter and adjust appearance and clothing options based on my selections
  So that I can easily personalize my character with appropriate and relevant visual options without confusion or unnecessary steps

  Background:
    Given the player is in the character customization screen
    And the system has all appearance options and clothing items fully loaded

  Scenario: Filter clothing options based on selected house colors
    Given the player selects a house with specific colors
    When the system loads clothing options
    Then only clothing items matching the chosen house colors are displayed
    And all non-matching clothing items are hidden

  Scenario: Adjust appearance options based on selected character gender
    Given the player selects the character gender as male
    When the system loads appearance customization options
    Then only hairstyles and facial features appropriate for the male gender are shown
    And hairstyles and facial features inappropriate for the male gender are hidden

  Scenario: Add robes and wizard hats when role is wizard or witch
    Given the player selects the role 'wizard'
    When the system loads clothing options
    Then robes and wizard hats are included in the list of available clothing choices
    And robes and wizard hats are not displayed if the role is not 'wizard' or 'witch'

  Scenario: Display magical accessories in preview and on character model
    Given the player selects magical accessories such as wands or scarves
    When the selection is made
    Then the magical accessories appear in the appearance preview window
    And the magical accessories are rendered on the in-game character model

  Scenario: Immediate update of character preview after any appearance or clothing change
    Given the player has made changes to customization settings
    And those settings include any combination of house colors, gender, hairstyles, robes, wizard hats, magical accessories, or facial features
    When the player changes any appearance or clothing option
    Then the character preview updates immediately reflecting all current selections without delay or requiring manual refresh
