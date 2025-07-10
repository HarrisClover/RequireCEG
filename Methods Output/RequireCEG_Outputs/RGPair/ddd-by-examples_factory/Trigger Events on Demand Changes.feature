Feature: Trigger Events on Demand Changes

  As a supply chain manager
  I want to receive notifications when demand forecasts are adjusted
  So that I can keep relevant stakeholders informed and manage inventory efficiently

  Background:
    Given a demand forecast exists for today or future dates
    And adjustments to demands can trigger notifications

  Scenario: Scenario 1: Notify stakeholders on demand change
    Given a demand forecast adjustment is made for today or future demands
    When the adjustment is processed
    Then an event notifying stakeholders is triggered
    And affected parties receive the updated demand information

  Scenario: Scenario 2: Preserve previous call-off data
    Given an adjustment occurs without a call-off document for a product
    When the adjustment is recorded
    Then the system preserves data from previous call-off documents

  Scenario: Scenario 3: Override adjustments with new call-off documents
    Given a subsequent call-off document is received for a product
    When the system processes the call-off
    Then the current adjustments are overridden by the new document

  Scenario: Scenario 4: Notify on conflicting adjustments
    Given a strong adjustment conflicts with future call-offs
    When the conflict is detected
    Then notifications are sent to relevant stakeholders
    And the discrepancies are outlined in the notifications

  Scenario: Scenario 5: Alert production planning team on potential shortages
    Given the system detects unfulfilled demands that could result in potential shortages on specific days
    When a potential shortage is identified for specific products on certain days
    Then alerts are issued to the production planning team
    And the alerts detail the affected products and dates of potential shortages

  Scenario Outline: Scenario Outline: Demand adjustment and notifications
    Given a demand adjustment of <adjustment-amount>
    And a call-off document <call-off-status>
    When the system processes the adjustment
    Then notifies stakeholders if <notification-required>
    Examples:
      | adjustment-amount | call-off-status | notification-required |
      | $500 | received | yes |
      | $200 | not received | no |
      | $300 | pending | yes |

