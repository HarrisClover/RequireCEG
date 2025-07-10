Feature: Predict Shortages Based on Demand Changes

  As a supply chain manager
  I want to monitor adjustments to demand forecasts and assess production plans
  So that I can proactively manage inventory and avoid stock shortages

  Background:
    Given the system is configured to track demand forecasts
    And there is existing inventory stock available

  Scenario: Scenario 1: Evaluate Demand Surpassing Available Stock
    Given a manual adjustment of the demand forecast to exceed current stock
    When the system evaluates the new demand level
    Then an alert should be generated
    And the message 'Warning: Demand exceeds available stock for the specified date.' should be displayed

  Scenario: Scenario 2: Future Call-off Supersedes Current Adjustment
    Given a demand adjustment has been made
    And a future call-off document has been submitted
    When the system evaluates the request
    Then the system should notify the user of the conflict
    And the message 'Conflict detected: Future call-off overrides current demand adjustment. Please review and resolve.' should be shown

  Scenario: Scenario 3: Modify Production Timelines Based on Demand Changes
    Given substantial demand changes that impact production schedules
    When the system processes the demand changes
    Then preceding production timelines should be shortened
    And succeeding timelines should be extended to accommodate the revised demand

  Scenario: Scenario 4: Insufficient Production Capacity Notification
    Given a demand change is substantial enough to indicate insufficient production capacity
    When the system processes the adjustment
    Then the system should prioritize quality assurance tasks on locked parts
    And a message 'Insufficient capacity detected. Prioritizing quality assurance on locked parts to ensure compliance with production standards.' should be displayed

  Scenario Outline: Scenario Outline: Handle Insufficient Production Capacity
    Given the demand change is substantial enough to indicate insufficient production capacity
    When the system processes the adjustment
    Then the system should prioritize quality assurance tasks on locked parts
    Examples:
      | demand_change | capacity_issue |
      | high | true |
      | medium | true |
      | low | false |

