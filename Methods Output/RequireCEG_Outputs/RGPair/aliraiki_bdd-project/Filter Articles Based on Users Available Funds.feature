Feature: Filter Articles Based on User's Available Funds

  As a customer
  I want the system to display only the items I can afford
  So that I can make informed purchasing decisions based on my budget

  Background:
    Given the user's available funds are set
    And the catalog contains various articles with different prices

  Scenario: Scenario 1: Affording some items
    Given the user has $300 available
    When the system filters the articles based on the user's available funds
    Then only items with prices less than or equal to $300 should be displayed
    And items priced above $300 should not be shown

  Scenario: Scenario 2: Affording no items
    Given the user has $50 available
    When the system filters the articles based on the user's available funds
    Then the message 'No items available' should be displayed
    And the system should not show any items that the user can afford

  Scenario: Scenario 3: Displaying articles within budget
    Given the user has $200 available
    When the system filters the articles based on the user's available funds
    Then only items with prices less than or equal to $200 should be displayed
    And items priced above $200 should not be shown

  Scenario Outline: Scenario Outline: Filtering Articles
    Given the user has <available-funds> available
    And the catalog contains articles with the following prices
    When the system filters the articles
    Then the following items should be displayed
    Examples:
      | available-funds | prices | displayed-items |
      | $150 | $100, $135, $200, $80 | $100, $135, $80 |
      | $250 | $50, $75, $80, $300 | $50, $75, $80 |
      | $90 | $40, $30, $100 | $40, $30 |
      | $200 | $150, $170, $50 | $150, $50 |

