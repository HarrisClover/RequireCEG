Feature: Adjust Production Schedules Based on Demand Changes

  As a production manager
  I want to adjust production schedules based on new demand levels
  So that I can effectively meet customer needs without exceeding production capacity

  Background:
    Given the current production capacity is known
    And the existing stock levels are tracked in real-time

  Scenario: Scenario 1: New demand exceeds production capacity
    Given a new demand level is received that exceeds the current production capacity
    When the system verifies the new demand
    Then a process to shorten preceding production timelines is initiated
    And succeeding timelines are delayed to prevent overlaps

  Scenario: Scenario 2: Receipt of conflicting call-off document
    Given a future call-off document is received
    When the document conflicts with a previous adjustment
    Then the system generates a notification detailing the discrepancy

  Scenario: Scenario 3: Shortage alert generation
    Given discrepancies arise between demand and production plans
    When existing stock levels are also considered
    Then alerts indicating potential shortage dates are generated

  Scenario: Scenario 4: Finalizing production schedule adjustment
    Given a demand adjustment is made for today's or future customer needs
    When the conditions to finalize adjustment are met
    Then the production schedule adjustment is finalized

  Scenario: Scenario 5: Delayed timelines with overlap prevention
    Given the new demand level exceeds current production capacity
    And a process to shorten preceding production timelines is initiated
    When succeeding timelines are delayed to prevent overlaps
    Then the system takes account of retooling times before finalizing changes

  Scenario: Scenario 6: Logging all adjustments and decisions
    Given all adjustments and decisions made during this process are occurring
    When the changes are applied in the system
    Then a log entry is created for these adjustments and decisions
