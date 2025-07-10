Feature: Customer Rewards Program Eligibility
  As a website user,
  I want my eligibility for rewards to be based on my engagement and preferences,
  So that I am motivated to use the website when I want rewards, and not bothered when I don't.

  Scenario: User wants rewards and uses the website
    Given the user has an account on the website
    And the user has opted IN to receive rewards
    When the user actively uses the website and meets the criteria for a reward (e.g., makes a qualifying purchase)
    Then the user should receive the tempting reward
    And the reward should be visible in the user's account or notifications

  Scenario: User does not want to use the website (or is inactive)
    Given the user has an account but has not logged in or interacted with the website for a significant period (e.g., > 90 days)
    # Assuming rewards are often tied to activity or specific opt-ins
    When the system checks for reward eligibility based on recent activity
    Then the user should not receive any new activity-based rewards

  Scenario: User uses the website but does not want rewards
    Given the user has an account on the website
    And the user is actively using the website
    And the user has opted OUT of receiving rewards
    When the user performs an action that would normally qualify for a reward (e.g., reaches a spending threshold)
    Then the user should NOT receive the reward
    And the user should not be notified about the reward they opted out of