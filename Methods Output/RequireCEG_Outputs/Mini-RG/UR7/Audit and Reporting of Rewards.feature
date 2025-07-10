Feature: Audit and Reporting of Rewards

  As a store owner
  I want to track user interactions and preferences regarding rewards
  So that I can maintain a comprehensive audit trail for reporting and compliance purposes

  Background:
    Given a user visits the website
    And the system is set up to log all reward-related engagements

  Scenario: User opts in for rewards
    Given a user logs into the system
    And the user indicates a desire to use the website
    And the user expresses interest in receiving rewards
    When the user browses for items
    Then the system grants the user rewards
    And the interaction is logged for audit purposes

  Scenario: User opts out of rewards
    Given a user logs into the system
    And the user indicates a desire to use the website
    And the user expresses disinterest in receiving rewards
    When the user adds items to the basket
    Then the system refrains from providing rewards
    And the interaction is logged for audit purposes

  Scenario: User does not wish to use the website
    Given a user indicates they do not wish to use the website
    When the system checks for eligibility of rewards
    Then no rewards are awarded
    And the decision is logged for audit purposes

  Scenario: User expresses interest but opts out
    Given a user logs into the system
    And the user indicates a desire to use the website
    And the user expresses interest in receiving rewards
    And the user indicates a desire to not receive rewards
    When the user interacts with the website
    Then the system does not grant rewards
    And the interaction is logged for audit purposes

  Scenario Outline: User's reward preference impact
    Given a user with preference <preference>
    And the system records the preference to <recorded-status>
    When the user interacts with the website
    Then the system grants/refrains from granting rewards based on preference
    Examples:
      | preference | recorded-status |
      | interested | granted |
      | not interested | not granted |
      | not using | none |

