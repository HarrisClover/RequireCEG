Feature: Ensure Capacity and Resource Utilization

  As a production planner
  I want to monitor demand and manage production scheduling effectively
  So that I can avoid shortages and optimize resource allocation

  Background:
    Given the system is set up to monitor demand adjustments
    And the current production capacity is established

  Scenario: Scenario 1: Demand exceeds production capacity
    Given a demand input is received that exceeds the available production capacity
    When the system assesses the demand
    Then a warning message should be generated notifying the production planner of potential shortages

  Scenario: Scenario 2: Demand aligns with production capacity
    Given the current demand aligns with the production capacity
    When the system schedules production
    Then the production schedule should be updated accordingly

  Scenario: Scenario 3: Conflicting production schedules
    Given new production schedules conflict with existing timelines
    When the system identifies the conflict
    Then the preceding timeline should be shrunk
    And the succeeding timelines should be delayed to create space for the new schedule

  Scenario: Scenario 4: Resource utilization alert
    Given resource utilization falls below established efficiency thresholds
    And the adjustment process is in progress
    When the system assesses resource allocation
    Then the production manager should be alerted to optimize resource allocation

  Scenario: Scenario 5: Handling conflicting future call-offs
    Given conflicting future call-off documents are received
    When the system highlights discrepancies in the documents
    Then the user should be prompted to prioritize the new call-off against previous adjustments
    And all changes should be logged systematically for reference and review
