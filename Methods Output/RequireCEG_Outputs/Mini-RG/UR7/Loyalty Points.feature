Feature: Loyalty Points

  As a user of the website
  I want to be able to opt in or decline rewards
  So that I can decide whether to participate in the rewards program

  Background:
    Given a user is on the website

  Scenario: User opts in for rewards
    Given the user expresses a desire to use the website
    And the user opts into the rewards program
    When the system processes the user's choice
    Then the user should receive tempting rewards
    And the system confirms the rewards enrollment

  Scenario: User declines rewards
    Given the user expresses a desire to use the website
    And the user declines to opt into the rewards program
    When the system processes the user's choice
    Then the system respects the user's choice by not granting any rewards
    And the system displays a message indicating they have chosen not to participate in the rewards program

  Scenario: User does not want to use the website
    Given the user does not express a desire to use the website
    When the system checks the user's intent
    Then the user should not receive any rewards
    And the system displays a message reflecting their inactive status regarding rewards

  Scenario: User opts in and then declines rewards
    Given the user expresses a desire to use the website
    And the user opts into the rewards program
    When the user later declines to opt into rewards
    Then the user should not receive any rewards
    And the system respects the user's decline and displays a message indicating their choice

  Scenario: User opts in without rewards participation
    Given the user expresses a desire to use the website
    And the user has opted into the rewards program
    But the user does not choose to participate in any rewards
    When the system checks the user's participation
    Then the system prevents the user from receiving any rewards
    And displays a message reflecting their inactive status regarding rewards
