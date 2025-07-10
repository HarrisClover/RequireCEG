Feature: Issue Alerts on Unfulfilled Demands

  As a store manager
  I want to be alerted when forecasted demand exceeds production capacity or stock levels
  So that I can take timely actions to prevent shortages

  Background:
    Given the system is monitoring forecasted demand levels
    And the production capacity and available stock levels are defined

  Scenario: Scenario 1: Trigger Alert on Demand Exceedance
    Given the forecasted demand for a product is 100 units
    And the production capacity for that product is 80 units
    When the system detects that forecasted demand exceeds production capacity
    Then an alert is issued
    And the alert includes the date, product affected, and description of unfulfilled demand

  Scenario: Scenario 2: Generate Discrepancy Notification
    Given the adjusted future demand forecast conflicts with incoming call-off documents
    When the system identifies the conflict between demand forecast and call-off documents
    Then a discrepancy notification is generated
    And the notification includes the nature of the adjustment and the related call-off document

  Scenario: Scenario 3: Issue Real-Time Alerts for Critical Stock Levels
    Given unfulfilled demand exceeds critical stock levels for a specific product
    When the system monitors stock levels
    Then a real-time alert is issued for unfulfilled demand exceeding critical stock levels
    And the alert includes details about the product and unfulfilled demand

  Scenario Outline: Scenario Outline: Alert on Unfulfilled Demand Exceedance
    Given the unfulfilled demand exceeds critical stock levels for <product>
    And the critical stock level is <critical-level>
    When the system monitors stock levels
    Then a real-time alert is issued
    Examples:
      | product | critical-level |
      | Tea | 50 |
      | Sunglasses | 20 |
      | Cookies | 30 |

