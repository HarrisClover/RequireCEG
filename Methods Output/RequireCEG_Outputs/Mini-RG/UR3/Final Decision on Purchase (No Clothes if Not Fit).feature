Feature: Final Decision on Purchase (No Clothes if Not Fit)

  As a shopper
  I want to determine if the clothing fits the measurements of the buyer
  So that I can ensure suitable purchases for both boys and girls

  Background:
    Given the boy's size is <boys-size>
    And the girl's size is <girls-size>

  Scenario: Scenario 1: Boy's Clothing Purchase
    Given the boy's size is 25
    And the girl's size is 22
    When the boy selects a piece of clothing size 25
    Then the clothing purchase is confirmed
    And the message 'Purchase successful for boy's clothing' is displayed

  Scenario: Scenario 2: Girl's Clothing Purchase
    Given the boy's size is 24
    And the girl's size is 21
    When the girl selects a piece of clothing size 21
    Then the clothing purchase is confirmed
    And the message 'Purchase successful for girl's clothing' is displayed

  Scenario: Scenario 3: Incompatible Sizes for Boys Clothes
    Given the boy's size is 35
    And the girl's size is 16
    When no clothing is selected
    Then no clothing should be purchased
    And the message 'No suitable clothing for purchase' is displayed

  Scenario: Scenario 4: Boy's Clothing Purchase Not Allowed
    Given the boy's size is 18
    And the girl's size is 26
    When no clothing is selected
    Then no clothing should be purchased
    And the message 'No suitable clothing for purchase' is displayed

  Scenario Outline: Scenario Outline: Fit Compatibility Check
    Given the boy's size is <boys-size>
    And the girl's size is <girls-size>
    When the boy tries on clothing size <boys-clothing-size>
    Then the decision is <decision>
    Examples:
      | boys-size | girls-size | boys-clothing-size | decision |
      | 25 | 22 | 25 | Purchase successful for boy's clothing |
      | 24 | 21 | 21 | Purchase successful for girl's clothing |
      | 30 | 25 | 32 | No suitable clothing for purchase |
      | 18 | 26 | 20 | No suitable clothing for purchase |

