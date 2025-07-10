Feature: Manage Resource Allocations Effectively

  As a system administrator
  I want to manage demand adjustments and production schedules
  So that I can maintain optimal stock levels and ensure timely fulfillment of customer demands

  Background:
    Given a customer has placed a demand for products
    And the system is set to track adjustments and production schedules

  Scenario: Adjust a demand and store it
    Given a demand adjustment is made today or for future demands
    When the adjustment is saved in the system
    Then the system should display 'Adjustment Stored'
    And the adjustment is available for future reference

  Scenario: Override previous adjustments without notification
    Given a new call-off document is processed
    When the document conflicts with any previous adjustments
    Then the system should override the previous adjustments
    And the customer is not explicitly notified about the override

  Scenario: Trigger shortage alert when demands are unfulfilled
    Given there are unfulfilled demands that may cause shortages
    When the system evaluates the demands for specific days
    Then an alert should be triggered displaying 'Shortage Alert'

  Scenario: Notify user on adjustment conflicts
    Given a demand adjustment conflicts with future call-offs
    When the system processes the conflicting demands
    Then the user should be notified with 'Discrepancy Notification: Adjustment Conflicts with Future Call-Off'

  Scenario: Adjust resource allocations on demand change
    Given a demand change occurs
    When the production planning module is notified
    Then the resource allocations should be adjusted according to the new demand

  Scenario: Adjust production timelines when new schedules are created
    Given new production schedules are initiated
    When the system processes the new adjustments
    Then preceding production timelines should be shortened
    And succeeding production timelines should be delayed
    And the system provides feedback: 'Production Timeline Adjusted: Preceding Shortened, Succeeding Delayed'

  Scenario: Evaluate demand and take action
    Given a demand evaluation is in process with current production plans and stock levels
    When the system detects conflicting demands
    Then the system should log the current evaluations appropriately
    And the required action should be taken as per existing conditions

  Scenario: Notify on customer notification status
    Given the customer has not been explicitly notified about the override
    When the status of customer notifications is checked
    Then the system confirms 'Customer not notified'
