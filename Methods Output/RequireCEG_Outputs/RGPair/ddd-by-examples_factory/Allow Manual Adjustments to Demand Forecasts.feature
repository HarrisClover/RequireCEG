Feature: Allow Manual Adjustments to Demand Forecasts

  As a supply chain manager
  I want to manually adjust demand forecasts and record changes accurately
  So that the production planning remains aligned with actual market needs

  Background:
    Given that the system maintains records of all existing call-off documents
    And the system is capable of tracking demand changes and stock levels

  Scenario: Manual adjustment to today's demand forecast
    Given a user wants to adjust today's demand forecast
    When the user makes a manual adjustment
    Then the system records the adjustment seamlessly
    And all existing call-off document data remains intact

  Scenario: Adjust demand without call-off document
    Given no call-off document exists for the product
    When the user initiates a manual adjustment
    Then the system allows the adjustment to proceed without interruptions

  Scenario: Override prior adjustment with future call-off
    Given a previous manual adjustment was made
    When a future call-off document is submitted
    Then the existing adjustment is overridden
    And the user is notified of this change unless specified otherwise

  Scenario: Alert for unfulfilled demand expectations
    Given current demands are compared against production plans and stock levels
    When a specific day is anticipated for unfulfilled demands
    Then the system issues an alert if the demands exceed the available stock for that day

  Scenario: Prioritizing quality assurance for locked parts
    Given parts are locked in stock
    When the system monitors stock levels
    Then quality assurance tasks related to those parts are prioritized

  Scenario: Adjust production planning based on demand fluctuations
    Given demand fluctuations necessitate changes in production planning
    When the system adjusts production schedules
    Then it ensures sufficient capacity and resource utilization
    And eliminates overlaps in the schedule

  Scenario: Notify system of demand change
    Given a manual adjustment to today's or future demand forecasts occurs
    When modification to the demand forecast occurs
    Then an event is triggered to notify the system of the change in demanded levels

  Scenario: Manage prior adjustment requests
    Given a customer specifically requests to retain the original adjustment
    When a manual adjustment conflicts with the prior adjustment
    Then the original adjustment is retained upon customer request

  Scenario: Notify discrepancies on substantial adjustments
    Given substantial adjustments to the demand forecast conflict with future call-offs
    Then appropriate notifications are provided for discrepancies between the demand forecast and future call-offs

  Scenario: Masking dependency on alerts for shortages
    Given an alert has been triggered for a specific day
    Then the system must not issue another alert for that same day
