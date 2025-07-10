Feature: Increment/Decrement Quantity within Limits

  As a customer
  I want to manage the quantity of items I purchase
  So that I can adjust my order within set limits

  Background:
    Given the system allows for a maximum quantity of 10 items
    And the system requires a minimum quantity of 1 item

  Scenario: Adding an item when quantity is less than 1
    Given the current item quantity is 0
    When I attempt to add the item
    Then an error message should be displayed stating 'At least 1 item must be selected'
    And the action should not be performed

  Scenario: Adding an item when quantity is greater than 10
    Given the current item quantity is 10
    When I attempt to add another item
    Then an error message should be displayed stating 'The maximum quantity allowed is 10'
    And the action should not be performed

  Scenario: Incrementing quantity when at minimum
    Given the current item quantity is 1
    When I click the increment button
    Then the item quantity should increase to 2
    And the total price should update accordingly

  Scenario: Decrementing quantity when at minimum
    Given the current item quantity is 1
    When I click the decrement button
    Then an error message should be displayed stating 'The minimum quantity cannot go below 1'
    And the action should not be performed

  Scenario: Decrementing quantity when at maximum
    Given the current item quantity is 10
    When I click the decrement button
    Then the item quantity should decrease to 9
    And the total price should update accordingly

  Scenario: Insufficient funds for selected quantity
    Given the current item price is $50
    And my available balance is $200
    When I set the quantity to 5
    Then the total price should be $250
    And the system should notify me of insufficient funds for that transaction
    And the action should be blocked

  Scenario: Incrementing quantity beyond current limits
    Given the current item quantity is 10
    When I click the increment button
    Then an error message should be displayed stating 'The maximum quantity allowed is 10'
    And the action should not be performed

  Scenario: Condition check for balance exceeding
    Given the current item price is $50
    And my available balance is $100
    When I set the quantity to 3
    Then the total price should be $150
    And the system should notify me of insufficient funds for that transaction
