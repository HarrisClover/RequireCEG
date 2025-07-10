Feature: Select Quantity of Articles for Purchase

  As a customer
  I want to select a valid quantity of articles for purchase
  So that I can complete the transaction successfully

  Background:
    Given the customer is logged into the system
    And the customer has sufficient funds available

  Scenario: Scenario 1: Quantity less than 1
    Given the user selects a quantity of 0
    When the user attempts to add the item to the basket
    Then the system should display the message 'Quantity must be at least 1.'

  Scenario: Scenario 2: Quantity exceeds 10
    Given the user selects a quantity of 11
    When the user attempts to add the item to the basket
    Then the system should display the message 'Quantity cannot exceed 10.'

  Scenario: Scenario 3: Valid quantity and sufficient funds
    Given the user selects a valid quantity of 3 for an item priced at $20
    When the user adds the item to the basket
    Then the total price should be $60 and the purchase should be processed.

  Scenario: Scenario 4: Insufficient funds
    Given the user selects a quantity of 2 for an item priced at $50
    And the user has only $80 available
    When the user attempts to finalize the purchase
    Then the system should respond with the message 'Insufficient funds for this transaction.'

  Scenario: Scenario 5: Sufficient funds for transaction with valid quantity and price calculation based on quantity selected and item price is allowed to proceed with the purchase request when total price does not exceed available funds, showing message 'Transaction successful.' when conditions met and purchase is processed successfully, else display message for invalid state. Exceeding funds will show 'Insufficient funds for this transaction.' and valid funds for tiered amounts will allow process of request with item pricing matched with total sum calculated for user provided quantity. Green light for total within limits, red light for out of limits. Validity statements checked with quantities exceeding or falling below thresholds in user context. Logic flows governing permissible selections and restricting total funds check. Maximizing offers and limiting failures through controlled feeds in transactions. Pricing outlined in clarity based on quantity from 1 to 10, with state changes reflecting on attempt to add item to basket and attempts to finalize with matching funds.
    Given the user selects a valid quantity of 5 for an item priced at $20
    And the user's available funds are sufficient at $150
    When the user attempts to finalize the purchase
    Then the total price should be $100
    And the system allows the transaction and displays the message 'Transaction successful.'
