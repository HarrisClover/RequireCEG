Feature: Tempting Rewards
  As a website user,
  I want to have the option to receive tempting rewards,
  So that I have an incentive to engage with the website.

  Scenario: Receive rewards when user opts in to use the website
    Given the user is registered on the website
    And the user has chosen to receive rewards
    When the user navigates to the rewards page
    Then the user should see a list of tempting rewards available

  Scenario: Do not receive rewards when user opts out of rewards
    Given the user is registered on the website
    And the user has chosen not to receive rewards
    When the user navigates to the rewards page
    Then the user should not see any rewards offered

  Scenario: Conflicting preference: Using the website without reward benefits
    Given the user is registered on the website
    And the user indicates they want to use the website but explicitly do not want any reward
    When the user navigates to the rewards page
    Then the user should not be presented with any reward options
