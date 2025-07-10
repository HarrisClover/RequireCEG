Feature: Define Size Range for Boys (20 to 30)

  As a store owner
  I want to ensure customers can only purchase items if suitable sizes are available
  So that customers have a satisfying shopping experience and avoid frustration

  Background:
    Given the available sizes for boys are defined within the range of 20 to 30
    And the store has items categorized for boys

  Scenario: No available sizes for boys
    Given that all sizes for boys are out of stock
    When a customer checks for boys' sizes
    Then a message should be displayed indicating that no suitable sizes exist for purchase
    And the user will not be allowed to proceed with any transactions

  Scenario: Some sizes available for boys
    Given that sizes in the range of 20 to 30 are available for boys
    When a customer checks for boys' sizes
    Then the customer will be allowed to proceed with the transaction

  Scenario: No sizes available for girls
    Given that there are no valid sizes available for girls based on the defined criteria
    When a customer checks for girls' sizes
    Then the user will not be allowed to proceed with any transactions
    And a message should be displayed indicating that the user is not allowed to proceed with any transactions

  Scenario: Alternative scenario out of stock for boys and girls
    Given that there are no valid sizes available for boys and no valid sizes available for girls based on the defined criteria
    When a customer checks for boys' or girls' sizes
    Then a message should indicate that no suitable sizes exist for purchase
    And the user will not be allowed to proceed with any transactions
