Feature: Opt-out Mechanism for Rewards

  As a user of the website
  I want to manage my reward preferences
  So that I can choose whether to receive rewards based on my engagement

  Background:
    Given the user has accessed the website
    And the user can see options for engaging with rewards

  Scenario: Scenario 1: User chooses to receive rewards
    Given the user decides to receive rewards
    When the user selects the option to engage with the website
    Then the system presents enticing rewards to the user
    And the user receives feedback on their reward eligibility

  Scenario: Scenario 2: User chooses not to engage with rewards
    Given the user decides not to engage with rewards
    When the user opts out of rewards before engaging
    Then the system confirms that the user will not receive rewards
    And the user receives no rewarding offers

  Scenario: Scenario 3: User opts out while engaging
    Given the user engages with the website
    When the user selects the option to opt-out of rewards
    Then the system respects the user's choice
    And the user does not receive any tempting rewards

  Scenario: Scenario 4: User indicates desire to use the website
    Given the user indicates a desire to use the website
    When the user interacts with the reward system
    Then the system provides appropriate feedback based on the user's choices regarding engagement and reward acceptance

  Scenario: Scenario 5: User chooses not to receive rewards
    Given the user chooses not to receive rewards
    When the user chooses to engage with the website
    Then the system does not provide any rewards to the user
