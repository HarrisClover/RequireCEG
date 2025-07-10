Feature: Reward Preference Settings

  As a user of the website
  I want to configure my reward preferences
  So that I can control my reward offerings based on my preferences

  Background:
    Given a user is presented with reward preferences
    And the user decides whether to use the website

  Scenario: User chooses to use the website with rewards enabled
    Given the user opts to use the website
    And the user's reward preference is set to 'receive rewards'
    When the user accesses the website
    Then the user receives a selection of tempting rewards
    And the reward mechanisms are active

  Scenario: User chooses to use the website with rewards disabled
    Given the user opts to use the website
    And the user's reward preference is set to 'do not receive rewards'
    When the user accesses the website
    Then the user does not receive any tempting rewards

  Scenario: User decides not to use the website
    Given the user does not want to use the website
    When the user declines to use the website
    Then the reward mechanisms are automatically disabled
    And the user does not receive any tempting rewards

  Scenario: User wants rewards but excludes certain types
    Given the user opts to use the website
    And the user's reward preference is set to 'receive rewards'
    And the user has excluded certain rewards
    When the user accesses the website
    Then the user receives tempting rewards omitting the excluded types

  Scenario: User configures preferences with rewards and exclusion
    Given the user opts to use the website
    And the user's reward preference is set to 'receive rewards'
    And the user has an exclusion for certain rewards
    When the user accesses the website
    Then the user receives tempting rewards excluding the specified rewards

  Scenario: User sets preference to do not receive rewards
    Given the user opts to use the website
    And the user's reward preference is set to 'do not receive rewards'
    When the user accesses the website
    Then the system disables any reward mechanisms

  Scenario: User configuration with reward preference and exclusion check
    Given the user opts to use the website
    And the user's reward preference is set to 'receive rewards'
    And the user has an exclusion for certain rewards
    And the user's reward preference is set to 'do not receive rewards'
    When the user accesses the website
    Then the user does not receive any tempting rewards
