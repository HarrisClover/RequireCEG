Feature: Preserve Data from Call-Off Documents

  As a supply chain manager
  I want to ensure that call-off document data is automatically stored and historical data remains intact
  So that I can efficiently manage product demand and production schedules

  Background:
    Given the system has access to product demand and historical data
    And call-off documents are received and processed accordingly

  Scenario: Scenario 1: Storing Call-Off Document Data
    Given a call-off document is received for a product
    And the system processes the call-off document
    When the system stores the associated data
    Then all historical data remains intact
    And the data can be retrieved for future reference

  Scenario: Scenario 2: Adjusting Demand Without Call-Off Document
    Given no call-off document is received
    When the system allows adjustments to be made for today's and future demand
    Then existing historical data is not lost
    And the system permits adjustments to be made without losing existing historical data

  Scenario: Scenario 3: Logging Adjustments
    Given an adjustment is made for product demand
    When the adjustment is saved
    Then the system logs the change with date and time for accountability

  Scenario: Scenario 4: Overriding Adjustments with Future Call-Off Document
    Given a call-off document is issued after an adjustment has been made
    And the customer explicitly notifies to keep the previous adjustments active
    When the system processes the future call-off document
    Then the previous adjustments are retained
    And the new call-off data is stored for future reference

  Scenario: Scenario 5: Logging Change with Date and Time of Adjustment
    Given an adjustment is made to today's or future demand
    When the adjustment is processed
    Then the system logs the change noting the date and time of the adjustment for accountability

  Scenario: Scenario 6: Triggering Events on Demand Changes
    Given demand changes occur in the system
    When the system detects the changes
    Then an event indicating the change in demanded levels is triggered
