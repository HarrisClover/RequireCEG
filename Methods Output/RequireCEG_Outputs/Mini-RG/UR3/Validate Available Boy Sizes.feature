Feature: Validate Available Boy Sizes

  As a store owner
  I want to validate available sizes for boys' and girls' clothes
  So that I can ensure customers can only purchase clothes in their appropriate sizes

  Background:
    Given the store offers boy's clothes size between 20 and 30 inclusive
    And the store offers girl's clothes size between 20 and 25 inclusive

  Scenario: Scenario 1: Valid Boy's Size
    Given a customer selects a boy's clothes size of 22
    When the customer attempts to purchase boy's clothes
    Then the purchase is allowed
    And a confirmation message is displayed

  Scenario: Scenario 2: Valid Girl's Size
    Given a customer selects a girl's clothes size of 24
    When the customer attempts to purchase girl's clothes
    Then the purchase is allowed
    And a confirmation message is displayed

  Scenario: Scenario 3: Invalid Boy's Size
    Given a customer selects a boy's clothes size of 32
    When the customer attempts to purchase boy's clothes
    Then the purchase is not allowed
    And a message indicating that the boy's clothes size is unavailable is displayed

  Scenario: Scenario 4: Invalid Girl's Size
    Given a customer selects a girl's clothes size of 26
    When the customer attempts to purchase girl's clothes
    Then the purchase is not allowed
    And a message indicating that the girl's clothes size is unavailable is displayed

  Scenario: Scenario 5: No Valid Sizes
    Given a customer selects a boy's clothes size of 19
    And a customer selects a girl's clothes size of 26
    When the customer attempts to purchase any clothes
    Then the purchase is not allowed
    And a message is displayed indicating that no valid sizes exist

  Scenario Outline: Scenario Outline: Boy's Size Fits Girl's Range
    Given a customer selects a boy's clothes size of <boy-size>
    When the customer attempts to purchase girl's clothes
    Then the purchase is allowed
    And a confirmation message is displayed
    Examples:
      | boy-size |
      | 20 |
      | 25 |
      | 22 |


  Scenario Outline: Scenario Outline: Girl's Size Fits Boy's Range
    Given a customer selects a girl's clothes size of <girl-size>
    When the customer attempts to purchase boy's clothes
    Then the purchase is allowed
    And a confirmation message is displayed
    Examples:
      | girl-size |
      | 20 |
      | 22 |
      | 25 |

