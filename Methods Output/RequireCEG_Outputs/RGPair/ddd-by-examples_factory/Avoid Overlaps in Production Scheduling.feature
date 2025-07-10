Feature: Avoid Overlaps in Production Scheduling

  As a production manager
  I want to adjust the production schedule based on demand
  So that I can efficiently meet customer needs without conflicts

  Background:
    Given a production schedule exists for products
    And demand adjustments may be necessary

  Scenario: Scenario 1: Adjusting demand without conflict
    Given the adjusted demand does not conflict with existing production schedules
    When the demand adjustment is applied
    Then the system should update the schedule accordingly
    And retooling times are factored into the adjusted schedule

  Scenario: Scenario 2: Adjusting demand with conflict
    Given the adjusted demand conflicts with existing production schedules
    When the user attempts to proceed with the adjustment
    Then the message 'Conflict Notification: Existing production schedules conflict with the adjusted demand' should be displayed

  Scenario: Scenario 3: Insufficient resource allocation detected
    Given the production schedule is adjusted
    When the user checks resource allocation
    Then an alert indicating 'Resource Allocation Alert: Potential shortages detected on [date]. Please resolve before finalizing the schedule.' should be issued

  Scenario: Scenario 4: Override existing adjustments
    Given the system receives a future call-off document that conflicts with existing adjustments
    When the system receives the future call-off document
    Then the message 'Future Call-off Document: Existing adjustments will be overridden unless specified otherwise by the customer.' should be displayed

  Scenario: Scenario 5: Customer requests to maintain adjustments
    Given the customer provides instructions to maintain previous adjustments
    When the system verifies the customer's request
    Then the system will confirm with 'Previous adjustments will remain in effect as per customer request.'

  Scenario: Scenario 6: User chooses to proceed with the adjustment
    Given the user chooses to proceed with the adjustment despite conflicts
    When the user confirms the action
    Then the adjusted demand should be processed according to the user's choice
    And conflict notifications should be logged for review

  Scenario: Scenario 7: Insufficient resource allocation due to adjusting demand
    Given the production schedule is adjusted and conflicts arise
    When the system checks resource allocation post-adjustment
    Then an alert indicating potential shortages should be displayed

  Scenario: Scenario 8: Existing adjustments must remain
    Given the existing adjustments are currently applicable
    When the system checks for conflicts
    Then all adjustments should remain effective unless overridden by user instructions
