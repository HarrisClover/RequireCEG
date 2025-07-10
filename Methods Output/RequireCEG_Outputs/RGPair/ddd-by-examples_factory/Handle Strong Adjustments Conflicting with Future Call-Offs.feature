Feature: Handle Strong Adjustments Conflicting with Future Call-Offs

  As a supply chain manager
  I want to manage strong adjustments carefully when conflicts with future call-off dates or quantities occur
  So that I can maintain accurate inventory levels and prevent shortages

  Background:
    Given the system has a strong adjustment in place
    And there exists a future call-off that overlaps in dates or quantities

  Scenario: Notification of Conflict Exists
    Given a strong adjustment is made with a conflicting future call-off
    When the system detects the conflict
    Then the system displays a notification to the user indicating that a conflict exists
    And the customer has not been notified of the discrepancy prior to finalizing the adjustment.

  Scenario: Override Adjustment for Earlier Future Call-Off
    Given a strong adjustment date is after a future call-off date
    When the user attempts to finalize the strong adjustment
    Then the system overrides the adjustment for the conflicting date
    And the future call-off date is earlier than the strong adjustment date.

  Scenario: Error Message for Unresolved Conflict
    Given a conflict exists between a strong adjustment and a future call-off
    When the user tries to finalize the strong adjustment
    Then the system prompts the user to confirm the adjustment despite the conflict or revert to original plans
    And the user tries to finalize the strong adjustment without resolving the noted conflict.

  Scenario: Alert for Potential Inventory Shortages
    Given a strong adjustment is made that could lead to inventory shortages
    When the system evaluates the inventory levels
    Then the system issues an alert detailing affected products and days
    And the strong adjustment leads to potential shortages in inventory.

  Scenario Outline: Quality Assurance on Locked Stock
    Given the system prioritizes quality assurance tasks on components that are locked in stock
    And the strong adjustment is linked to inventory management
    When the strong adjustment is executed
    Then quality assurance tasks are executed to mitigate risks
    Examples:
      | adjustment-date | call-off-date | product | risk | action |
      | 2023-10-01 | 2023-09-25 | Widget A | potential shortage | execute quality assurance |
      | 2023-10-05 | 2023-10-04 | Widget B | inventory conflict | alert user |
      | 2023-10-15 | 2023-10-10 | Widget C | no conflict | proceed with adjustments |

