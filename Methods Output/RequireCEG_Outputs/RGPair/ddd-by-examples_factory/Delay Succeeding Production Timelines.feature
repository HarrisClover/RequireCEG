Feature: Delay Succeeding Production Timelines

  As a production manager
  I want the system to automatically adjust production schedules based on demand changes
  So that I can ensure our production timelines are accurate and conflict-free

  Background:
    Given a demand change occurs that significantly impacts production levels
    And existing production schedules are in place

  Scenario: Review conflicts in production schedule
    Given the demand adjustment requires a new production schedule
    And the adjusted timeline conflicts with existing schedules
    When the system identifies the conflicts
    Then a message indicating which schedules are at risk should be displayed
    And the production manager is notified of the conflicts

  Scenario: Finalize adjustments without conflicts
    Given a demand change occurs that does not conflict with existing call-offs
    When the system updates the production schedule
    Then the adjustments should be seamlessly integrated into the schedule
    And a log of all alterations is maintained for future reference

  Scenario: Automatically update succeeding production timelines
    Given the current demand levels change significantly
    When the system processes the change
    Then the succeeding production timelines should be automatically updated
    And a detailed log of alterations is created

  Scenario: Maintain detailed logs of adjustments
    Given a demand change occurs
    When the production schedule is updated
    Then the system must maintain a detailed log of all alterations
    And the log must not be empty

  Scenario Outline: Scenario Outline: Notify user of discrepancies
    Given the demand change is substantial enough to override existing call-offs
    And the user must review and confirm the adjustments
    When the system generates a discrepancy notification
    Then the user should be prompted to review the adjustments
    Examples:
      | demand change | override existing | notification type | review required |
      | high | yes | discrepancy | yes |
      | medium | yes | alert | no |
      | low | no | info | no |

