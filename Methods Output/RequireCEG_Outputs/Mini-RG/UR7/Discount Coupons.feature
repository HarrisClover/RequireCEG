Feature: Discount Coupons

  As a user
  I want to express my interest in using the website and engage with the platform
  So that I can receive rewards and discount coupons based on my engagement

  Background:
    Given the user is on the website
    And the user has the option to express their interest

  Scenario: Scenario 1: User shows interest and wants rewards
    Given the user expresses interest in using the website
    And the user confirms their interest in receiving rewards
    When the system evaluates the user's eligibility for rewards
    Then the user is eligible for rewards
    And the system generates and provides discount coupons

  Scenario: Scenario 2: User shows interest but does not want rewards
    Given the user expresses interest in using the website
    When the user explicitly states they do not want any rewards
    Then the system refrains from issuing any rewards

  Scenario: Scenario 3: User does not wish to use the website
    Given the user does not express interest in engaging with the website
    When the system evaluates the user's intent
    Then the system ensures no tempting rewards are provided

  Scenario: Scenario 4: User shows interest, confirmation, but ineligible for rewards
    Given the user expresses interest in using the website
    And the user confirms their interest in receiving rewards
    When the system evaluates the user's eligibility for rewards
    Then the user is ineligible for rewards
    And the system does not generate or provide any discount coupons

  Scenario Outline: Scenario Outline: User eligibility for rewards
    Given the user expresses interest in using the website and is eligible for rewards
    And the user confirms interest in receiving rewards
    When the system processes the reward issuance
    Then the user receives appropriate discount coupons
    Examples:
      | user_status | reward_interest | eligibility | coupon_given |
      | interested | yes | eligible | 10% off coupon |
      | interested | no | eligible | none |
      | not interested | N/A | not applicable | none |
      | interested | yes | not eligible | none |

