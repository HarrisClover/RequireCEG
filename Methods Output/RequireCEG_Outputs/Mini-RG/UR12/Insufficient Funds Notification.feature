Feature: Insufficient Funds Notification

  As a user
  I want to initiate transactions regardless of my age and balance
  So that I can manage my funds appropriately without exceeding limits

  Background:
    Given a user with an age and balance
    And the transaction type is defined

  Scenario: Scenario 1: Adult Sending Funds
    Given the user is an adult
    And the user has an available balance of at least 100 euros
    When the user tries to send 50 euros
    Then the transaction is approved
    And the user's balance is updated to 50 euros

  Scenario: Scenario 2: Non-Adult Sending Funds Exceeding Limit
    Given the user is not an adult
    And the user attempts to send 25 euros
    When the user submits the transaction
    Then the transaction is denied
    And the notification 'You can only send up to 20 euros as a non-adult.' is displayed

  Scenario: Scenario 3: Sending Funds Exceeding Balance
    Given the user is any age
    And the user tries to send an amount greater than their available balance of 30 euros
    When the user submits the transaction
    Then the transaction is denied
    And the notification 'Insufficient funds for this transaction.' is displayed

  Scenario: Scenario 4: Adult Withdrawing Funds
    Given the user is an adult
    And the user has an available balance of at least 100 euros
    When the user requests to withdraw 50 euros
    Then the withdrawal is approved
    And the user's balance is updated to 50 euros

  Scenario: Scenario 5: Adult Withdrawing Funds Exceeding Balance
    Given the user is an adult
    And the user tries to withdraw an amount greater than their available balance of 30 euros
    When the user submits the withdrawal
    Then the withdrawal is denied
    And the notification 'Insufficient funds for withdrawal.' is displayed

  Scenario: Scenario 6: Non-Adult Withdrawing Funds
    Given the user is not an adult
    When the user attempts to withdraw any amount
    Then the withdrawal is denied
    And the notification 'Only adults can withdraw funds.' is displayed

  Scenario: Scenario 7: Withdrawal with Sufficient Balance
    Given the user is an adult
    And the user has an available balance of 50 euros
    When the user attempts to withdraw 30 euros
    Then the withdrawal is approved
    And the user's balance is updated to 20 euros
