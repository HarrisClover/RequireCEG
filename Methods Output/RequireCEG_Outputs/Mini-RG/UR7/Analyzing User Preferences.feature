Feature: Analyzing User Preferences

  As a user
  I want the system to check my rewards program status and present relevant rewards
  So that I can benefit from personalized offers and rewards

  Background:
    Given a user visits the website
    And the user has opted into the rewards program

  Scenario: Scenario 1: User opted into rewards program
    Given the user has preferences set in the system
    When the user indicates intent to use the website
    Then the system retrieves the user's preferences
    And the system displays relevant, enticing rewards based on those preferences

  Scenario: Scenario 2: User opted out of rewards program
    Given the user has opted out of the rewards program
    When the user indicates intent to use the website
    Then the system respects the user's choice by not displaying rewards

  Scenario: Scenario 3: User shows no intent
    Given the user is browsing without indicating intent to use the website
    When the user does not display any actions indicating intent
    Then the system presents a message encouraging the user to return for potential future rewarding experiences

  Scenario: Scenario 4: User indicates intent without rewards program
    Given the user has opted out of the rewards program
    When the user indicates intent to use the website
    Then the system does not display any rewards

  Scenario: Scenario 5: User indicates intent but shows no preferences
    Given the user has preferences not set in the system
    When the user indicates intent to use the website
    Then the system retrieves options but displays no relevant rewards
