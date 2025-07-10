Feature: Condition-based Reward Granting

  As a website user
  I want to receive rewards based on my engagement and preferences
  So that I can feel appreciated for my interaction with the website

  Background:
    Given a user visits the website
    And the user has the option to opt in or out of receiving rewards

  Scenario: Scenario 1: User opts in for rewards
    Given the user expresses interest in receiving rewards
    And the user is using the website
    And the user has engaged sufficiently with the site
    When the system evaluates user engagement metrics
    Then the user should receive rewards
    And the rewards should correspond to the engagement metrics

  Scenario: Scenario 2: User opts out of rewards
    Given the user chooses to opt out of receiving rewards
    When the system confirms the opt-out choice
    Then no rewards should be granted
    And the system should display a message 'You have opted out of receiving rewards.'

  Scenario: Scenario 3: User does not use the website
    Given the user indicates that they do not wish to use the website
    Then no rewards should be allocated
    And the system should display a message 'No rewards have been granted as you are not using the website.'

  Scenario: Scenario 4: User is not engaged with the website
    Given the user is using the website
    And the user has expressed interest in receiving rewards
    When the user does not engage sufficiently with the site
    Then no rewards should be granted
    And the system should display a message 'No rewards have been granted as you are not engaged with the website.'
