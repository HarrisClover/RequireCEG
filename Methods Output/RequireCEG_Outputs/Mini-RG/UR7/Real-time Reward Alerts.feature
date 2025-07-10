Feature: Real-time Reward Alerts

  As a user of the website
  I want to receive rewards notifications when I express interest in using the website
  So that I can benefit from personalized offers that match my preferences

  Background:
    Given a user has not opted out of rewards notifications
    And the user has clicked the 'Join Now' button to express interest

  Scenario: Scenario 1: User clicks Join Now
    Given the user successfully logs into the system
    When the user clicks the 'Join Now' button
    Then the user receives rewards notifications
    And the user can see personalized offers

  Scenario: Scenario 2: User has opted out of rewards
    Given the user previously opted out of rewards notifications
    When the user clicks the 'Join Now' button
    Then the user does not receive any rewards notifications

  Scenario: Scenario 3: User without rewards preferences
    Given the user has opted out of rewards notifications
    When the user does not express interest
    Then the user does not receive any rewards notifications

  Scenario Outline: Scenario Outline: User engages with rewards alerts
    Given the user has expressed interest in using the website
    And the user clicks on a rewards alert
    When the system analyzes the user's preferences
    Then the user receives personalized offers based on their interests
    Examples:
      | Interest | Opted Out | Action | Outcome |
      | interested | False | click 'Join Now' | receives rewards notifications |
      | interested | True | click 'Join Now' | does not receive rewards notifications |
      | interested | False | click rewards alert | receives personalized offers |
      | not interested | False | click rewards alert | does not receive any offers |

