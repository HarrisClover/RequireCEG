Feature: Adjusting demand forecasts and production planning
  As a production manager,
  I want to adjust demand forecasts and manage production schedules
  So that I can ensure that production meets customer demand and any changes in demand are handled efficiently

  Scenario Outline: Adjusting demand and production schedules based on demand changes
    Given the system is tracking current and future demands
    And the user has access to adjust demand forecasts
    When a user manually adjusts the demand forecast for <adjustment-period>
    And the user modifies a call-off document or a new one is received for <product>
    Then the system should store the adjustment and trigger an event indicating the change in demand
    And the system should check for potential shortages for <product> and alert the user
    And if a strong adjustment conflicts with a future call-off for <product>, the system should notify the user
    And the system should adjust production schedules to accommodate new demands, considering retooling times
    And the system should prioritize quality assurance tasks on locked parts in stock

  Examples:
    | adjustment-period | product    | potential-shortage |
    | today             | Tea Shirt  | Yes                |
    | future            | Sunglasses | No                 |
    | today             | Cookies    | Yes                |
    | future            | Sunglasses | Yes                |
