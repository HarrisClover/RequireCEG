Feature: Prioritize Quality Assurance for Locked Parts

  As a production manager
  I want to ensure timely evaluations and prioritization of quality assurance tasks for locked parts
  So that production schedules can be effectively managed based on quality and demand

  Background:
    Given a part is considered locked if it is not available for production
    And quality assurance tasks are required for locked parts

  Scenario: Locked part passes quality assurance
    Given a locked part
    And quality assurance indicates a 'pass' status
    When the system evaluates the part
    Then production is scheduled based on current demand
    And relevant stakeholders are notified

  Scenario: Locked part fails quality assurance
    Given a locked part
    And quality assurance indicates a 'fail' status
    When the system evaluates the part
    Then production schedules are held for the failed part
    And a notification is sent to the production team to review the failed part

  Scenario: Multiple locked parts with concurrent demands
    Given multiple locked parts with different demand levels
    When quality assurance tasks are triggered
    Then the highest demand part's quality assurance is prioritized
    And other parts are placed on standby until the evaluation is complete

  Scenario: Adjustment in demand levels for locked parts
    Given a locked part with demand level <old-demand>
    And the demand level adjusts to <new-demand>
    When the system processes the adjustment
    Then quality assurance priorities are reset to reflect the new demand
    And previous assessments are recorded for reference
