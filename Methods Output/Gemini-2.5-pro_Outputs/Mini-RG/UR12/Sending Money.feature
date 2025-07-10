Feature: Sending Money
  As a user (adult or non-adult)
  I want to send money according to age-based rules
  So that I can make transactions for my business appropriately.

  Scenario: Adult user sends money successfully
    Given an "adult" user is logged into the system
    And the user has a balance of 100 euros
    When the user attempts to send 50 euros
    Then the transaction should be successful
    And the user's balance should be 50 euros

  Scenario Outline: Non-adult user sending money within or exceeding the limit
    Given a "non-adult" user is logged into the system
    And the user has a balance of 50 euros
    When the user attempts to send <Amount> euros
    Then the transaction result should be <Result>
    And the user's final balance should be <Final_Balance> euros

    Examples:
      | Amount | Result     | Final_Balance | Description                     |
      | 15     | successful | 35            | Below limit                     |
      | 20     | successful | 30            | Exactly limit                   |
      | 20.01  | rejected   | 50            | Slightly above limit            |
      | 25     | rejected   | 50            | Clearly above limit             |

