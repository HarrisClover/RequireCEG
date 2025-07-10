Feature: Risk Checks for Order Submission (e.g., RISK_NSF)

  As a client
  I want to ensure my orders do not exceed my available funds and meet trading limits
  So that I can place trades without encountering issues related to insufficient funds or risk

  Background:
    Given the client has a current balance
    And the client has defined trading limits

  Scenario: Order submission with sufficient funds
    Given the client attempts to place a bid
    And the order amount is within their available funds
    When the system evaluates the order
    Then the order is accepted and processed
    And the client receives notification of successful order submission along with their updated balance

  Scenario: Order submission with insufficient funds
    Given the client attempts to place an ask order
    And the order amount exceeds their available funds
    When the system evaluates the order
    Then an error message 'Insufficient funds' is presented to the client

  Scenario: Order submission passes RISK_NSF check
    Given the client's order meets funds requirements
    When the system runs the RISK_NSF check
    Then the order is accepted
    And the client receives notification of successful order submission along with their updated balance

  Scenario: Order submission fails RISK_NSF check due to insufficient margin
    Given the client's order meets funds requirements
    When the system runs the RISK_NSF check
    And the risk assessment fails due to insufficient margin
    Then a warning message detailing 'Risk check failed: Insufficient margin' is shown to the client

  Scenario: Order submission fails RISK_NSF check due to account restrictions
    Given the client attempts to place an order
    And the order submissions meet funds requirements
    When the system runs the RISK_NSF check
    And the risk assessment fails due to account restrictions
    Then a warning message detailing 'Account restrictions apply.' is shown to the client

  Scenario Outline: Modify existing order
    Given the client has an existing order
    And the client wants to modify the order amount to <new-amount>
    When the system evaluates the modified order against the client's current balance and trading limits
    Then the modification is <outcome>
    Examples:
      | new-amount | outcome |
      | $150 | accepted and processed |
      | $3000 | rejected with 'Insufficient funds' |

