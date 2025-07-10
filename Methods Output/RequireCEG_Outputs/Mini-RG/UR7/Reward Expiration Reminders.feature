Feature: Reward Expiration Reminders

  As a store owner
  I want to manage user rewards in a way that encourages website interaction
  So that users stay engaged and do not lose their rewards

  Background:
    Given a user has expressed a desire to use the website
    And the user has opted to receive rewards

  Scenario: Scenario 1: User opts in for rewards
    Given a user logs into the system
    And the user indicates they want to use the website for rewards
    When the user engages with the website and earns rewards
    Then the system tracks the reward expiration date
    And the user receives a notification of any upcoming expirations

  Scenario: Scenario 2: User does not want rewards
    Given a user logs into the system
    When the user indicates that they do not want rewards
    Then the system does not allocate any rewards to the user

  Scenario: Scenario 3: User receives rewards and they expire soon
    Given a user has earned rewards
    And the user engages with the website
    When the rewards are nearing expiration
    Then the system provides rewards to the user
    And the system sends notifications about upcoming expiration dates

  Scenario: Scenario 4: User explicitly states they do not want rewards
    Given a user logs into the system
    When the user explicitly states they do not want any rewards
    Then the system does not provide rewards to the user

  Scenario Outline: Scenario Outline: Reward Expiration Notification
    Given a user has earned <reward-amount> rewards
    And the nearest expiration date is <expiration-date>
    When it is <current-date>
    Then the user receives a reward expiration notification
    Examples:
      | reward-amount | expiration-date | current-date |
      | $50 | 2023-10-30 | 2023-10-20 |
      | $100 | 2023-11-15 | 2023-10-25 |
      | $25 | 2023-12-01 | 2023-11-25 |

