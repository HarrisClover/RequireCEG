Feature: Simulate Transaction Timeouts

  As a system administrator
  I want to monitor and handle transaction timeouts for car and hotel bookings
  So that the integrity of transactions is preserved and customers are informed of any issues

  Background:
    Given a predefined timeout threshold is set
    And the transaction system is operational

  Scenario: Scenario 1: Timeout during car booking
    Given a customer initiates a car booking transaction
    When the transaction exceeds the predefined timeout threshold
    Then a TxStartedEvent is logged
    And a TxAbortedEvent is logged
    And the number of car units booked is reset to zero and confirmation status is updated to 'Cancelled.'

  Scenario: Scenario 2: Timeout during hotel booking
    Given a customer initiates a hotel booking transaction
    When the transaction exceeds the predefined timeout threshold
    Then a TxStartedEvent is logged
    And a TxAbortedEvent is logged
    And the number of hotel units booked is reset to zero and confirmation status is updated to 'Cancelled.'

  Scenario: Scenario 3: Log compensate acknowledgment upon timeout
    Given a customer initiates a car booking transaction
    And the transaction exceeds the predefined timeout threshold
    When the timeout occurs during car booking
    Then a TxCompensateAckSucceedEvent is logged

  Scenario: Scenario 4: Log compensate acknowledgment upon timeout
    Given a customer initiates a hotel booking transaction
    And the transaction exceeds the predefined timeout threshold
    When the timeout occurs during hotel booking
    Then a TxCompensateAckSucceedEvent is logged

  Scenario Outline: Scenario Outline: Transaction Timeout Handling
    Given the transaction is initiated for <booking-type>
    And the timeout occurs after <timeout-duration>
    When the timeout threshold is exceeded
    Then a TxStartedEvent is logged
    And a TxAbortedEvent is logged
    Examples:
      | booking-type | timeout-duration |
      | car | 5 minutes |
      | hotel | 10 minutes |

