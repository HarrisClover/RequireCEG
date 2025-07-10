Feature: Display Total Costs for User Assessment Before Purchase

  As a customer
  I want to see the total cost of my selected items before finalizing my purchase
  So that I can ensure I have enough funds and make informed purchasing decisions

  Background:
    Given the user has a balance
    And the user selects a quantity of articles

  Scenario: Scenario 1: Valid quantity and sufficient balance
    Given the user selects 2 T-Shirts priced at $100 each
    And the user has a balance of $300
    When the system calculates the total cost
    Then the total cost should be $200
    And the user should see the total cost updated dynamically in real-time

  Scenario: Scenario 2: Valid quantity but insufficient balance
    Given the user selects 5 Sunglasses priced at $135 each
    And the user has a balance of $600
    When the system calculates the total cost
    Then the total cost should be $675
    And the system should display an error message indicating insufficient funds

  Scenario: Scenario 3: Invalid quantity selected
    Given the user selects 11 articles, which exceeds the allowed limit
    When the system attempts to calculate the total cost
    Then the system should not display the total cost
    And the user should see an error message indicating the quantity is invalid

  Scenario Outline: Scenario Outline: Selecting articles and checking balance
    Given the user selects <quantity> articles priced at <price>
    And the user has a balance of <balance>
    When the system calculates the total cost
    Then the total cost should be <total>
    And the user should see <message>
    Examples:
      | quantity | price | balance | total | message |
      | 1 | $100 | $100 | $100 | Total cost is within balance |
      | 3 | $200 | $500 | $600 | Total cost is within balance |
      | 4 | $150 | $500 | $600 | Total cost exceeds balance |

