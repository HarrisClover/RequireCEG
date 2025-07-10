Feature: Single Scenario Sleeping for Five Seconds

  As a system user
  I want the system to execute sleep operations of specified duration without interruption
  So that I can ensure that timed processes run reliably and as intended

  Background:
    Given the system is ready to process sleep requests
    And the system has a queuing mechanism implemented for overlapping sleep requests

  Scenario: Scenario 1: Sleep for Five Seconds
    Given a sleep request is initiated for five seconds
    When the sleep operation is executed
    Then the system should successfully complete the five-second sleep
    And no other sleep operations should interrupt the initial sleep request

  Scenario: Scenario 2: Overlapping Sleep Request
    Given a five-second sleep operation is currently in progress
    When a new sleep request for one second is received
    Then the system should queue the new sleep request for execution after the five-second sleep
    And the system should maintain stable performance during sleep operations

  Scenario: Scenario 3: Simultaneous Sleep Request Prevention
    Given multiple sleep requests are initiated simultaneously
    When the system processes the requests
    Then the system should trigger an alert to notify that simultaneous sleep operations are not allowed
    And the system should reject additional sleep requests while processing the first request

  Scenario Outline: Scenario Outline: Multiple Sleep Requests
    Given a sleep request is initiated for <duration>
    And a concurrent sleep request for <concurrent-duration> is received
    When the system processes the sleep requests
    Then the system should execute the <duration> sleep without interruption
    And the <concurrent-duration> sleep should be queued
    Examples:
      | duration | concurrent-duration |
      | 5 seconds | 1 second |
      | 10 seconds | 3 seconds |
      | 15 seconds | 5 seconds |

