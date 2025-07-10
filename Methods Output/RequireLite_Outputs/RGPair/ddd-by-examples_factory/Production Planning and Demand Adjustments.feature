Feature: Production Planning and Demand Adjustments

  As a store owner
  I want to manage demand forecasts and production schedules effectively
  So that I can avoid shortages and ensure resource allocations are aligned with customer needs

  Background:
    Given the system is capable of tracking current and future customer demands
    And manual adjustments can be made for today's and future demands

  Scenario: Scenario 1: Adjusting Demand Forecasts
    Given a customer requests an adjustment to today's demand for a specific product
    When the store owner selects the product and enters the new demand value in the adjustment field
    Then the system records the adjustment for reference
    And the adjustment triggers a 'demand change' event

  Scenario: Scenario 2: Handling Future Call-Off Documents
    Given a future call-off document exists for a product with specified quantities
    When the system receives a new call-off document submitted by an authorized personnel
    Then the new call-off document overrides any previous adjustments
    And all affected stakeholders receive a notification of the update

  Scenario Outline: Scenario Outline: Monitoring for Shortages
    Given the demand is set to <demand>
    When the system evaluates demands against production plans
    Then the system should alert for potential shortages if demanded levels exceed <threshold>
    And the system maintains a production plan with production capacity of <production-amount>
    Examples:
      | demand | production-amount | threshold |
      | 500 | 300 | 400 |
      | 600 | 550 | 500 |
      | 700 | 450 | 600 |


  Scenario: Scenario 3: Prioritizing Quality Assurance
    Given parts are locked in stock for quality assurance tasks
    When the system receives a request to adjust production schedules for non-quality assurance tasks
    Then the system prioritizes quality assurance tasks over other adjustments
    And the system provides a notification to the production manager about the priority status
