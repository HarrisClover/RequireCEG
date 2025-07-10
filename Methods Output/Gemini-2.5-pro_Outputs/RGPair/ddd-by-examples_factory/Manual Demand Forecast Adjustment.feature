Feature: Manual Demand Forecast Adjustment
  As a Demand Planner
  I want to manually adjust demand forecasts for products
  So that the system reflects the most current understanding of customer needs.

  Background:
    Given the system has demand data for Product "XYZ"
    And today's date is "2024-07-15"

  Scenario: Successfully adjusting future demand
    Given the demand for Product "XYZ" on "2024-08-01" is 100 units
    When the user adjusts the demand for Product "XYZ" on "2024-08-01" to 120 units
    Then the demand forecast for Product "XYZ" on "2024-08-01" should be 120 units
    And a record of this adjustment (user, timestamp, previous value 100, new value 120) should be stored
    And a "Demand Changed" event should be triggered for Product "XYZ" on "2024-08-01"

  Scenario: Successfully adjusting today's demand
    Given the demand for Product "XYZ" on "2024-07-15" is 50 units
    When the user adjusts the demand for Product "XYZ" on "2024-07-15" to 60 units
    Then the demand forecast for Product "XYZ" on "2024-07-15" should be 60 units
    And a record of this adjustment should be stored
    And a "Demand Changed" event should be triggered for Product "XYZ" on "2024-07-15"

  Scenario: Attempting to adjust past demand
    Given the demand for Product "XYZ" on "2024-07-10" was 80 units
    When the user attempts to adjust the demand for Product "XYZ" on "2024-07-10" to 90 units
    Then the adjustment should be rejected
    And the demand forecast for Product "XYZ" on "2024-07-10" should remain 80 units
    And an error message indicating "Adjustments only allowed for today or future dates" should be displayed

  Scenario: Adjusting demand for a product without a current call-off document
    Given Product "ABC" exists in the system
    And there is no call-off document for Product "ABC" for "2024-09-01"
    And the current demand forecast for Product "ABC" on "2024-09-01" is 0 units
    When the user adjusts the demand for Product "ABC" on "2024-09-01" to 25 units
    Then the demand forecast for Product "ABC" on "2024-09-01" should be 25 units
    And a record of this adjustment should be stored
    And a "Demand Changed" event should be triggered for Product "ABC" on "2024-09-01"

