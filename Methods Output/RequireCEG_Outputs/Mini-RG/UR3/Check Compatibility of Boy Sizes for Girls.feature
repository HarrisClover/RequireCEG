Feature: Check Compatibility of Boy Sizes for Girls

  As a store owner
  I want to ensure the correct sizing options for boys and girls clothing
  So that I can facilitate appropriate clothing purchases for customers

  Background:
    Given the boy's size is within the range of 20 to 30
    And the girl's size is within the range of 20 to 25

  Scenario: Scenario 1: Matching Girl's Size Found
    Given the boy's size is 24
    When the customer attempts to purchase
    Then Purchase allowed for girl's clothing
    And the corresponding girl's size is 24

  Scenario: Scenario 2: Matching Girl's Size Not Found but Within Range
    Given the boy's size is 22
    When the customer attempts to purchase
    Then Purchase allowed for boy's clothing for girl
    And the boy's size 22 is within the range of available girl sizes

  Scenario: Scenario 3: No Size Match Found
    Given the boy's size is 15
    When the customer attempts to purchase
    Then Purchase not allowed: No size match found

  Scenario: Scenario 4: Boy's Size Out of Range
    Given the boy's size is 31
    When the customer attempts to purchase
    Then Purchase not allowed: No size match found

  Scenario Outline: Scenario Outline: Closest Size Match
    Given the boy's size is <boy-size>
    When the customer attempts to purchase
    Then the purchase message should be <purchase-message>
    Examples:
      | boy-size | purchase-message |
      | 21 | Purchase allowed for boy's clothing for girl |
      | 23 | Purchase allowed for girl's clothing |
      | 26 | Purchase not allowed: No size match found |
      | 25 | Purchase allowed for girl's clothing |

