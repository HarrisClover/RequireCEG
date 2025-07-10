Feature: Demand Forecast and Production Planning Adjustments 
As a production planner, I want to manually adjust demand forecasts for today and future dates, So that the system maintains accurate records of customer needs and production plans are optimally updated.

Scenario to verify manual adjustments to demand forecasts
Scenario: Manually adjust demand forecasts for today and future dates Given the current demand forecasts and production plans are loaded into the system And the system allows adjustments for today's and future demands only When a user makes a manual adjustment to the demand forecast for a selected date Then the adjustment is recorded for reference And an event is triggered indicating a change in demanded levels

Scenario to verify that call-off document data is preserved during adjustments
Scenario: Preserve call-off document data when adjusting demands Given a call-off document is present for a product And historical call-off document data is stored in the system When a user adjusts the demand forecast for that product without an existing document Then the system preserves the call-off document data in the record And the adjustment is applied only to the current and future demand forecasts

Scenario to ensure future call-off documents override adjustments unless notified otherwise
Scenario: Future call-off document override of manual adjustments Given manual adjustments have been made for a product And a future call-off document is received for the same product When no customer notification indicates otherwise Then the future call-off document overrides the manual adjustments And the historical manual adjustments remain intact for reference

Scenario to verify alerts are issued for potential shortages
Scenario: Alert issuance for potential shortages due to demand changes Given production plans and current stock levels are monitored continuously And demand forecasts have been manually adjusted When the adjustments lead to forecasted demands that exceed current production or stock levels Then the system issues an alert for potential shortages on the affected days

Scenario to adjust production schedules based on demand changes
Scenario: Dynamic production schedule adjustment based on demand changes Given the system has recorded production plans and capacity details When demand adjustments are made that affect production planning Then the system recalculates production timelines And preceding production schedules are shrunk while succeeding schedules are delayed to account for retooling times And resource utilization is reallocated to match the new demands

Scenario to handle conflicts between strong demand adjustments and future call-offs
Scenario: Handling conflicts between demand adjustments and future call-offs Given strong manual adjustments have been applied for a product And a conflicting future call-off document is received When the conflict is detected by the system Then the system provides an appropriate notification of the discrepancy And if the customer has notified that adjustments should be preserved, then the manual adjustments remain intact Otherwise, the future call-off document takes precedence