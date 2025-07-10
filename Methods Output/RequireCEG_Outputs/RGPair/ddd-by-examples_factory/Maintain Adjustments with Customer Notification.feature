Feature: Maintain Adjustments with Customer Notification

  As an authorized user
  I want to manually adjust today's demand and log these changes
  So that customers are notified about demand adjustments and can be aware of potential shortages

  Background:
    Given the demand for a product is being manually adjusted
    And the user is authorized to make this adjustment

  Scenario: Manual Adjustment of Today's Demand
    Given a demand adjustment of 50 units for product A
    And the user is John Doe
    When the adjustment is saved in the system
    Then the change is logged with a timestamp and user details
    And the customer receives a notification about the adjustment

  Scenario: Preserving Previous Manual Adjustments
    Given multiple manual adjustments have been made for product A
    When a new call-off document is received
    Then all previous adjustments are preserved in the system

  Scenario: Override Previous Adjustments
    Given no request from the customer to maintain prior adjustments
    When a new call-off document arrives for product A
    Then the system automatically overrides all previous adjustments with new data
    And the customer receives a notification about the adjustment

  Scenario: Notification of Adjustment Conflict
    Given an adjustment for product A conflicts with a new call-off
    When the conflict is detected
    Then the system issues a notification to relevant stakeholders outlining the discrepancy

  Scenario: Alert for Production Planning Shortages
    Given adjustments indicate potential shortages for product A
    When the adjustments are processed
    Then an alert is generated to notify stakeholders about unfulfilled demands

  Scenario: Future Demand Adjustment Handling With Conflict
    Given a future demand for product A is adjusted manually by John Doe
    And the adjustment creates a conflict with a new call-off document
    When the conflict is detected
    Then the system issues a notification to relevant stakeholders outlining the discrepancy
    And the future demand adjustment is logged with a timestamp and user details

  Scenario Outline: Scenario Outline: Future Demand Adjustment Handling
    Given the demand for product <product> is manually adjusted by <user>
    And the adjustment indicates a need for <units> units
    When a new call-off document arrives for product <product>
    Then the system checks if the customer requested to maintain prior adjustments
    And the system acts accordingly to <action>
    Examples:
      | product | user | units | action |
      | A | John Doe | 50 | override previous adjustments |
      | B | Jane Smith | 30 | preserve adjustments |
      | C | Jim Brown | 20 | issue notification |

