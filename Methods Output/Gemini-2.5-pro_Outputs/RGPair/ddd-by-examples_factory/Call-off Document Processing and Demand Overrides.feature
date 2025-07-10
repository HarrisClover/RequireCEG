Feature: Call-off Document Processing and Demand Overrides
  As the System
  I want to process incoming call-off documents and interact with manual adjustments correctly
  So that demand forecasts accurately reflect the latest confirmed customer requirements or intentional overrides.

  Background:
    Given Product "XYZ" has demand data
    And today's date is "2024-07-15"

  Scenario: Future call-off overrides a previous manual adjustment (Standard Procedure)
    Given the user previously adjusted the demand for Product "XYZ" on "2024-08-10" to 150 units
    And the adjustment was not flagged to be retained against call-offs
    When a new call-off document arrives for Product "XYZ" specifying a demand of 130 units for "2024-08-10"
    Then the demand forecast for Product "XYZ" on "2024-08-10" should be updated to 130 units
    And the system should record that the call-off document overrode the manual adjustment
    And the original call-off document data should be preserved
    And a "Demand Changed" event should be triggered for Product "XYZ" on "2024-08-10"

  Scenario: Manual adjustment is retained despite a future call-off (Customer Notification)
    Given the user previously adjusted the demand for Product "XYZ" on "2024-08-15" to 200 units
    And the adjustment was flagged to be retained based on customer notification
    When a new call-off document arrives for Product "XYZ" specifying a demand of 180 units for "2024-08-15"
    Then the demand forecast for Product "XYZ" on "2024-08-15" should remain 200 units
    And the system should record the conflict: call-off demand 180, retained adjustment 200
    And the original call-off document data should be preserved
    And a notification should be generated regarding the discrepancy between the call-off and the retained adjustment
    And no "Demand Changed" event should be triggered (as the demand value didn't change)

  Scenario: Handling conflicting adjustment and call-off without retention flag
    Given the user previously adjusted the demand for Product "XYZ" on "2024-09-01" to 500 units (considered a 'strong' adjustment by context, but not flagged for retention)
    When a new call-off document arrives for Product "XYZ" specifying a demand of 300 units for "2024-09-01"
    Then the demand forecast for Product "XYZ" on "2024-09-01" should be updated to 300 units (standard override)
    And the system should record that the call-off document overrode the manual adjustment
    And a notification should be generated regarding the discrepancy (significant change from adjustment 500 to call-off 300)
    And a "Demand Changed" event should be triggered for Product "XYZ" on "2024-09-01"

