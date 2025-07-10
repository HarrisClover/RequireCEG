Feature: Viewing Product Information
  As a user
  I want to view detailed information about a product, including a concise description
  So that I can make an informed purchase decision.

  Scenario: Viewing product details with a short description
    Given a product "Simple Item" has the description "A basic but useful item." (less than 50 chars)
    When the user views the information page for "Simple Item"
    Then the displayed description should be "A basic but useful item."
    And the description should not end with an ellipsis

  Scenario: Viewing product details with a long description requiring truncation
    Given a product "Complex Gadget" has the description "This is a very detailed description of the complex gadget, explaining all its features and benefits far beyond the fifty character limit."
    When the user views the information page for "Complex Gadget"
    Then the displayed description should be truncated with an ellipsis (e.g., "This is a very detailed description of the complex ...")
    And the displayed description text (excluding ellipsis) should not exceed 50 characters.