Feature: Reward Criteria Definition

  As a user of the website
  I want to manage the presentation of rewards based on my preferences
  So that I can have a tailored experience while using the website

  Background:
    Given a user is presented with the option to receive rewards
    And the user has the ability to express their interest in receiving rewards

  Scenario: Scenario 1: User opts in for rewards
    Given the user actively expresses a desire to receive rewards
    When the user navigates through the website
    Then the system will display the available tempting rewards to the user
    And the user can view and select from the presented rewards

  Scenario: Scenario 2: User opts out of rewards
    Given the user is using the website but does not wish to receive any rewards
    When the user navigates through the website
    Then the system will refrain from presenting any rewards
    And no rewards will be offered to the user

  Scenario: Scenario 3: User does not use the website
    Given the user decides not to use the website at all
    When the user does not interact with the website
    Then the system will refrain from presenting any rewards
    And no rewards will be available or given

  Scenario: Scenario 4: System behavior when the user does not wish to receive rewards
    Given the user does not wish to receive any rewards
    When the user navigates through the website
    Then the system will refrain from presenting any rewards
    And the action is consistent with the user's decision

  Scenario Outline: Scenario Outline: User changes reward preferences
    Given the user initially opts to receive rewards
    And the user later decides to opt out
    When the user navigates through the website again
    Then the system should reflect the user's latest preference
    And no rewards should be presented if the user opted out
    Examples:
      | User Preference | Action | Expected Outcome |
      | Opted In | Navigates to homepage | Rewards are displayed |
      | Opted Out | Navigates to homepage | No rewards are displayed |
      | Not Using | Visits the website | No rewards are displayed |
      | Opted In | Logs out | No rewards are displayed |

