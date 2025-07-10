Feature: Validate Media Overlay Features

  As a content creator
  I want to ensure all media resources are present and correctly linked in the EPUB document
  So that my document complies with EPUB standards and is usable across various platforms

  Background:
    Given the EPUB document contains referenced media overlay resources
    And the document is structured according to EPUB specifications

  Scenario: Valid media overlay with all resources present
    Given the media overlay resource is available
    And all referenced media resources are present within the document structure
    And the referenced media resources are correctly linked within the document
    When the system validates the document
    Then the validation report indicates no errors
    And the document is compliant with EPUB standards

  Scenario: Missing media overlay resource
    Given the document references a media overlay resource
    And a necessary media overlay file is missing
    When the system validates the document
    Then the validation report indicates the absence of the resource

  Scenario: Incompatible media format
    Given the media resources comply with required specifications for media types
    And the document contains deprecated attributes related to media overlays
    When the system validates the document
    Then the validation report issues a warning about potential compatibility issues

  Scenario: Audio files in media overlays
    Given the media overlay involves audio files encoded in a valid format
    And the files are accessible under the specified paths
    When the system checks the audio resources
    Then the validation report confirms the audio files are valid

  Scenario Outline: Scenario Outline: Validate audio files in media overlays
    Given the media overlay involves audio files encoded in <audio-format>
    And the files are accessible under the specified paths
    When the system checks the audio resources
    Then the validation report confirms the audio files are valid
    Examples:
      | audio-format | resource-path |
      | MP3 | /path/to/audio1.mp3 |
      | AAC | /path/to/audio2.aac |
      | WAV | /path/to/audio3.wav |

