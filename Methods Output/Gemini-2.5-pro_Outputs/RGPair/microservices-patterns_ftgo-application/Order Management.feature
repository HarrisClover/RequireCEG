Feature: Order Management
  As a consumer,
  I want to place, revise, and cancel my food orders
  So that I can manage my meal requests effectively through the Order Service.

  Scenario: Successfully placing an order with a valid credit card
    Given a registered consumer "Alice"
    And the restaurant is currently accepting orders
    And "Alice" has a valid credit card ending in "1234"
    When "Alice" places an order for "1 Pizza" with the valid credit card
    Then the order should be approved
    And an "OrderAuthorized" event should be published for the order

  Scenario: Attempting to place an order with an expired credit card
    Given a registered consumer "Bob"
    And the restaurant is currently accepting orders
    And "Bob" has an expired credit card ending in "5678"
    When "Bob" attempts to place an order for "1 Burger" with the expired credit card
    Then the order should be rejected
    And an "OrderRejected" event should be published for the order

  Scenario: Successfully revising an existing order
    Given a registered consumer "Charlie"
    And "Charlie" has successfully placed an order (Order ID "Order-XYZ") for "1 Salad"
    When "Charlie" revises order "Order-XYZ" to contain "1 Salad" and "1 Drink"
    Then order "Order-XYZ" should be updated to reflect the changes with "1 Salad" and "1 Drink"

  Scenario: Successfully cancelling an existing order
    Given a registered consumer "Diana"
    And "Diana" has successfully placed an order (Order ID "Order-ABC") for "1 Pasta"
    When "Diana" cancels order "Order-ABC"
    Then the status of order "Order-ABC" should be updated to "canceled"