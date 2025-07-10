Feature: Demand Forecast Adjustment and Production Planning
  As a system user,
  I want to facilitate manual adjustments to demand forecasts
  So that accurate records are maintained, and future customer needs are met while managing production effectively

Scenario Outline: Adjusting demand forecasts and managing production plans
  Given that the system has a forecast for the product <product>
  And the user adjusts the demand forecast for <product> to <adjusted-forecast>
  And the current demand forecast is <current-forecast>
  When a call-off document for <product> is received for <forecast-date>
  Then the system should store the adjusted forecast for reference
  And the adjusted demand forecast should be <adjusted-forecast>
  And the system should flag any unfulfilled demand as a potential shortage
  And the production schedule should be adjusted accordingly to meet the new demand forecast
  And if the adjusted forecast conflicts with future call-offs, the system should notify the user of the discrepancy
  And the system should prioritize quality assurance for locked parts in stock

Examples:
  | product  | adjusted-forecast | current-forecast | forecast-date | adjusted-forecast |
  | Widget A | 500               | 400               | 2025-04-15    | 500               |
  | Widget B | 1200              | 1000              | 2025-04-20    | 1200              |
  | Widget C | 800               | 600               | 2025-04-22    | 800               |

Scenario: Handling shortages and production scheduling conflicts
  Given that the production schedule for <product> on <schedule-date> is <current-production-status>
  When an unfulfilled demand triggers a shortage alert
  Then the system should issue an alert for the shortage of <product>
  And the production planning module should adjust the production schedule to prioritize <product> while considering any retooling time
  And the system should ensure that preceding production timelines are shortened and succeeding timelines are delayed

Examples:
  | product  | schedule-date | current-production-status |
  | Widget A | 2025-04-15    | On Schedule               |
  | Widget B | 2025-04-20    | Delayed                   |
  | Widget C | 2025-04-22    | On Hold                   |

Scenario: Manual adjustment conflict resolution
  Given that a manual adjustment has been made for <product>
  And a future call-off document for <product> exists
  When the call-off document is processed
  Then the system should check if the manual adjustment conflicts with the future call-off
  And if a conflict is found, the system should notify the user of the discrepancy
  And the system should apply the future call-off document and retain the previous adjustments for reference unless specified otherwise by the customer

Examples:
  | product  | manual-adjustment | future-calloff-date | conflict-notification |
  | Widget A | 500               | 2025-04-15          | Yes                   |
  | Widget B | 1000              | 2025-04-20          | No                    |
  | Widget C | 800               | 2025-04-22          | Yes                   |
