Feature: Shrink Preceding Production Timelines

  As a production manager
  I want to be notified of conflicting future call-off documents
  So that I can ensure all stakeholders are informed and aligned on the production adjustments

  Background:
    Given a newly adjusted production schedule is in place
    And a call-off document is received

  Scenario: Notification of Conflicts
    Given the received call-off document conflicts with the adjusted schedule
    When the system detects the discrepancies
    Then the user should receive a notification detailing the conflicting aspects
    And the user must acknowledge the discrepancies before finalizing the production timelines

  Scenario: User Acknowledgment Requirement
    Given a conflicting call-off document is notified to the user
    When the user reviews the discrepancies
    Then the user must acknowledge the notification before proceeding
    And the production timelines should only be finalized after acknowledgment

  Scenario: Discrepancy Notification to Stakeholders
    Given the user acknowledges the discrepancies
    When the acknowledgment is recorded
    Then all stakeholders should be informed regarding the production adjustments
    And the adjustments should be finalized only after notifying stakeholders

  Scenario Outline: Scenario Outline: Detailed Notification
    Given a conflicting call-off document is received with <conflicting-details>
    And the adjusted schedule contains <adjusted-details>
    When the conflict is detected in the system
    Then the user receives a detailed notification outlining <notification-details>
    Examples:
      | conflicting-details | adjusted-details | notification-details |
      | Delivery date for item X | Adjusted delivery for item Y | Conflict on delivery dates for items X and Y |
      | Quantity mismatch for item Z | Adjusted quantity for item Z | Conflict on quantities for item Z |
      | Pricing discrepancy for item A | Adjusted pricing for item A | Conflict on pricing for item A |

