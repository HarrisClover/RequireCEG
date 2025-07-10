Feature: Provide Notifications for Discrepancies in Demand

  As a store owner
  I want to receive notifications for demand adjustments that conflict with current stock levels and production schedules
  So that I can manage resources efficiently and fulfill customer requirements effectively

  Background:
    Given that a demand adjustment has been made for a product
    And there exists a future call-off document associated with that product

  Scenario: Notify on Call-Off Document Override
    Given the adjusted demand exceeds planned production capacity
    When the system checks for future call-off documents
    Then a notification indicating the adjustment will be overridden by the call-off is generated
    And it notifies the user if no explicit different instructions have been received from the customer

  Scenario: Alert on Stock Limits
    Given a demand adjustment is made
    When the adjustment exceeds stock levels for the specified day
    Then an alert is issued indicating a potential shortage due to adjusted demand

  Scenario: Notify Conflicts with Production Schedules
    Given demand changes lead to discrepancies with production timelines
    When the system detects a conflict between adjustments and planned production
    Then the user is notified of the discrepancies
    And options for resolving the conflicts are provided

  Scenario: Alert Stakeholders on Demand Level Changes
    Given a demand adjustment has resulted in a level change for the demanded products
    When the demand change is processed
    Then real-time notifications are sent to all relevant stakeholders

  Scenario: Alert on Demand Exceeds Production Capacity
    Given the adjusted demand exceeds planned production
    And there is an existing future call-off document for the product
    When the system reviews production and call-off constraints
    Then an alert is generated signifying a potential shortage

  Scenario: Notify on Conflicting Demand Adjustments
    Given there is a conflict between the demand adjustment and planned production timelines
    When the system detects this discrepancy
    Then the user is notified of the discrepancies
    And options for resolving conflicts between the adjustment and the production schedule are provided
