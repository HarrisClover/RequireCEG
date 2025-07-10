Feature: Clothing Purchase for Boys and Girls

  As a store owner
  I want to enable customers to buy the right size clothes for boys and girls
  So that I can ensure they get properly fitting clothes

  Background:
    Given the boy clothes size range is 20 to 30
    And the girl clothes size range is 20 to 25

  Scenario: Purchase boy clothes that fit the boy
    Given the selected size for the boy is 25
    When the customer tries to purchase boy clothes in size 25
    Then the purchase should be successful

  Scenario: Purchase girl clothes that fit the girl
    Given the selected size for the girl is 22
    When the customer tries to purchase girl clothes in size 22
    Then the purchase should be successful

  Scenario: Cannot purchase clothes that do not fit
    Given the selected size for the boy is 35
    When the customer tries to purchase boy clothes in size 35
    Then the purchase should fail
    And the customer should receive a notification that the size is unavailable

  Scenario: Boy can wear girl clothes
    Given the selected size for the boy is 23 and the girl clothes size is also 23
    When the customer selects girl clothes in size 23 for the boy
    Then the purchase should be successful

  Scenario: Girl can wear boy clothes
    Given the selected size for the girl is 24 and the boy clothes size is also 24
    When the customer selects boy clothes in size 24 for the girl
    Then the purchase should be successful

  Scenario Outline: Clothes fitting check
    Given the selected size for the boy is <boy-size>
    When the customer checks for available clothes in these sizes
    Then the purchase should be <purchase-status>
    And the selected size for the girl is <girl-size>
    Examples:
      | boy-size | girl-size | purchase-status |
      | 25 | 22 | successful |
      | 30 | 25 | successful |
      | 24 | 23 | successful |
      | 10 | 20 | failed |

