Feature: Truncate Long Descriptions with Ellipsis

  As a product manager
  I want to ensure product descriptions are concise and readable
  So that customers can easily understand product information at a glance

  Background:
    Given a product with a description

  Scenario: Scenario 1: Description exceeds character limit
    Given the product description is longer than 50 characters
    When the product information page is rendered
    Then the description should be truncated to the first 50 characters
    And an ellipsis '...' should be appended to the truncated description

  Scenario: Scenario 2: Description within character limit
    Given the product description is 50 characters or fewer
    When the product information page is rendered
    Then the full description should be displayed without alterations

  Scenario: Scenario 3: Description exceeds character limit - Expected Action E1 Triggered when C1 is true (Truncate and Append Ellipsis)
    Given the product description length exceeds 50 characters
    When the product information page is rendered
    Then the action E1 should occur by truncating the description and appending '...'
    And the product description displayed should be 'Truncated description...'

  Scenario: Scenario 4: Description within character limit - Expected Action E2 Triggered when C2 is true (Display Full Description)
    Given the product description length is 50 characters or fewer
    When the product information page is rendered
    Then the action E2 should occur by displaying the full description without alterations

  Scenario Outline: Scenario Outline: Different length descriptions
    Given the product description is <description>
    When the product information page is rendered
    Then the displayed description should be <expected-output>
    Examples:
      | description | expected-output |
      | This is a short description. | This is a short description. |
      | This description exceeds fifty characters and needs to be truncated. | This description exceeds fifty characters and needs to... |

