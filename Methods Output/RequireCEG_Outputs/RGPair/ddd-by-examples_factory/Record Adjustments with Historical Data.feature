Feature: Record Adjustments with Historical Data

  As a store manager
  I want to log manual adjustments made to demand forecasts
  So that I can maintain a clear record of changes and their impacts on inventory

  Background:
    Given the system is operational
    And a user has appropriate permissions to make adjustments

  Scenario: Scenario 1: Record a manual adjustment
    Given the current demand forecast is $1000
    And a user decides to adjust the forecast to $800
    When the user saves the adjustment
    Then the system logs the original forecast of $1000, the new forecast of $800, and the timestamp of the adjustment
    And the user is notified of the successful adjustment

  Scenario: Scenario 2: Override manual adjustments with future call-offs
    Given a manual adjustment of $800 exists
    And no customer has notified the system regarding the manual adjustments
    When a future call-off document of $900 is received
    Then the system overrides the manual adjustment with the new call-off amount
    And the user receives a notification of the override

  Scenario: Scenario 3: Retain manual adjustments when notified
    Given a manual adjustment of $800 exists
    And the customer has notified the system regarding the manual adjustments
    When a future call-off document of $900 is received
    Then the system retains the manual adjustment of $800
    And the user receives a notification confirming the retention of the adjustment

  Scenario: Scenario 4: Notify user of conflicting adjustments
    Given a manual adjustment with a forecast of $800
    And a simultaneous call-off request of $900
    When both the adjustment and call-off are processed
    Then the system generates a notification detailing the conflicting demands
    And the user is notified to review the adjustments

  Scenario: Scenario 5: Handle potential shortages due to demand changes
    Given the demand forecast is adjusted causing a shortage classification
    When the system detects the shortage
    Then a record of the shortage is created in the exceptions log
    And the system provides access to historical data of all previous adjustments

  Scenario: Scenario 6: Simultaneous adjustment and call-off process
    Given the current demand forecast is $800
    And a future call-off document of $900 is being processed alongside
    When both events occur
    Then the system generates a notification to the user about the simultaneous processing
    And details of both the adjustment and call-off are logged for review
