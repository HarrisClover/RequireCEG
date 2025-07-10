Feature: Shortage Monitoring and Alerting
  As a Production Planner or System Monitor
  I want the system to continuously monitor demand against production plans and stock levels
  So that potential shortages can be identified and alerted proactively.

  Scenario Outline: Detecting potential shortages
    Given the current stock level for Product "P1" is <stock> units
    And the production plan for Product "P1" adds <production> units before <demand_date>
    And the total demand for Product "P1" on <demand_date> is <demand> units
    When the system evaluates supply vs demand for <demand_date>
    Then a shortage alert <alert_status> be generated for Product "P1" on <demand_date>

    Examples:
      | stock | production | demand_date | demand | alert_status | Description                     |
      | 100   | 500        | "2024-08-20"| 700    | should       | Demand exceeds stock+production |
      | 100   | 500        | "2024-08-20"| 600    | should not   | Demand equals stock+production  |
      | 100   | 500        | "2024-08-20"| 550    | should not   | Demand within stock+production  |
      | 0     | 200        | "2024-08-21"| 250    | should       | Demand exceeds production       |

