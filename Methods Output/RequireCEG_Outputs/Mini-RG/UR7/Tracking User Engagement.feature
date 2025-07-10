Feature: Tracking User Engagement

  As a website visitor
  I want to engage with tempting rewards based on my preferences
  So that my experience on the website aligns with my interests and choices

  Background:
    Given a user visits the website
    And the user expresses their interest in the website

  Scenario: User agrees to receive rewards
    Given the user is open to receiving tempting rewards
    When the system presents the available tempting rewards
    Then the user sees a list of tempting rewards
    And the interaction is logged for refining user experience

  Scenario: User declines rewards
    Given the user explicitly states that they do not want any rewards
    When the system acknowledges their preference
    Then no tempting rewards are presented to the user
    And the interaction is logged for refining user experience

  Scenario: User does not wish to use the website
    Given the user expresses that they do not wish to use the website
    When the system processes their decision
    Then no tempting rewards are presented to the user
    And the interaction is logged for refining user experience

  Scenario: User is engaged and also does not want rewards
    Given the user expresses a desire to use the website
    And the user explicitly states that they do not want any rewards
    When the system processes their decision
    Then no tempting rewards are presented to the user
    And the interaction is logged for refining user experience

  Scenario: User opens rewards but later declines
    Given the user expresses a desire to use the website
    And the user indicates they are open to receiving tempting rewards
    And the user explicitly states that they do not want any rewards
    When the system presents the available tempting rewards
    Then the user sees a list of tempting rewards
    And the system acknowledges their preference not to receive rewards
