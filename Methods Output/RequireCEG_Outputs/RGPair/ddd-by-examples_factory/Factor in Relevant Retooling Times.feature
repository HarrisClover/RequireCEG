Feature: Factor in Relevant Retooling Times

  As a production manager
  I want to adjust the production schedule based on demand changes
  So that I can ensure efficient resource utilization and meet customer demand

  Background:
    Given that a demand adjustment has occurred
    And the current production schedules are set

  Scenario: Scenario 1: Check retooling time adequacy
    Given the calculated retooling time for the production line
    And the available retooling time is adequate to accommodate the preceding production timelines
    When the system evaluates the production schedules
    Then the schedules for the preceding production lines should be shrunk appropriately
    And resource utilization should be maintained without conflict

  Scenario: Scenario 2: Notify user for required adjustments
    Given the calculated retooling time needed exceeds the available retooling time
    When the system identifies the time conflict
    Then the system should generate a notification alerting the user of the required adjustments

  Scenario: Scenario 3: Evaluate new call-off documents
    Given the system receives a call-off document that contradicts the updated production schedule
    When the user evaluates the new call-off against the existing schedule
    Then the system should trigger an alert asking the user to evaluate and prioritize the new call-off

  Scenario Outline: Scenario Outline: Update production plan
    Given the user has evaluated the new call-off document and found no conflicts
    When the system processes the updated demand
    Then the production plan should be updated to reflect the new demand
    And resource utilization should not overlap or exceed capacity
    Examples:
      | demand_change | available_retool_time | new_production_plan | resource_utilization |
      | Increased demand | Adequate | Updated production plan reflects increase | Within capacity |
      | Decreased demand | Inadequate | Production plan remains unchanged | Within capacity |
      | Conflicting demand | Sufficient | Requires user evaluation | Potential conflict |

