Feature: Shipping Cost Calculation
  As a customer,
  I want the correct shipping cost calculated based on my cart total
  So that I know the final price before checkout.

  Background:
    # No specific background needed for these scenarios,
    # but could be used for setting up a user or cart if required by the system context.

  Scenario Outline: Calculate shipping cost based on cart total tiers
    Given the shopping cart subtotal is <Cart Subtotal>
    When the system calculates the shipping cost
    Then the shipping cost should be <Expected Shipping Cost>

    Examples: Tiered Shipping Costs
      | Description                     | Cart Subtotal | Expected Shipping Cost |
      # Rule: <= $25 -> $3.99 (Requirement is ambiguous here vs == $25, assuming < $25)
      | Below $25 threshold             | $10.00        | $3.99                  |
      | Just below $25 threshold        | $24.99        | $3.99                  |
      # Rule: == $25 -> $4.99
      | Exactly $25 threshold           | $25.00        | $4.99                  |
      # Rule: > $25 and <= $50 -> $4.99 (Requirement is ambiguous here vs == $50, assuming < $50)
      | Between $25 and $50             | $35.50        | $4.99                  |
      | Just above $25 threshold        | $25.01        | $4.99                  |
      | Just below $50 threshold        | $49.99        | $4.99                  |
      # Rule: == $50 -> $6.99
      | Exactly $50 threshold           | $50.00        | $6.99                  |
      # Rule: > $50 and <= $75 -> $6.99 (Requirement is ambiguous here vs == $75, assuming < $75)
      | Between $50 and $75             | $65.75        | $6.99                  |
      | Just above $50 threshold        | $50.01        | $6.99                  |
      | Just below $75 threshold        | $74.99        | $6.99                  |
      # Rule: == $75 -> $8.99
      | Exactly $75 threshold           | $75.00        | $8.99                  |
      # Rule: > $75 and <= $100 -> $8.99 (Requirement is ambiguous here vs == $100, assuming < $100)
      | Between $75 and $100            | $88.20        | $8.99                  |
      | Just above $75 threshold        | $75.01        | $8.99                  |
      | Just below $100 threshold       | $99.99        | $8.99                  |
      # Rule: == $100 -> $10.99
      | Exactly $100 threshold          | $100.00       | $10.99                 |
      # Rule: > $100 -> $10.99
      | Just above $100 threshold       | $100.01       | $10.99                 |
      | Well above $100 threshold       | $250.00       | $10.99                 |