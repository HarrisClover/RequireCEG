Feature: Accessibility Options (Colorblind Mode, Subtitles)

  As a player with visual or hearing accessibility needs
  I want the game to provide colorblind-friendly palettes and optional subtitles
  So that I can clearly see visual effects and understand audio content regardless of my sensory preferences or impairments

  Background:
    Given the game supports multiple accessibility settings
    And Colorblind Mode and Subtitles can be configured independently

  Scenario: Enable Colorblind Mode
    Given Colorblind Mode is enabled
    When the game displays spell effects, UI elements, and visual indicators
    Then all these use colorblind-friendly palettes designed for maximum clarity
    And no standard magical color schemes or effects are shown

  Scenario: Disable Colorblind Mode
    Given Colorblind Mode is disabled
    When the game displays spell effects, UI elements, and visual indicators
    Then all these consistently use the standard magical color schemes without color modification

  Scenario: Enable Subtitles
    Given Subtitles are enabled
    When character dialogues, spell incantations, important audio cues, or relevant narrative elements play
    Then all these are displayed as synchronized text captions aligned accurately with the audio playback timing

  Scenario: Disable Subtitles
    Given Subtitles are disabled
    When character dialogues, spell incantations, important audio cues, or relevant narrative elements play
    Then all audio content plays without any textual captions or overlays

  Scenario: Independent Operation of Colorblind Mode and Subtitles
    Given any combination of Colorblind Mode and Subtitles settings (enabled or disabled)
    When the game runs
    Then Colorblind Mode behaves strictly according to its setting, enabling or disabling colorblind-friendly palettes accordingly
    And Subtitles behave strictly according to its setting, enabling or disabling textual captions independent of Colorblind Mode
    And the operation of one setting does not influence or override the other
