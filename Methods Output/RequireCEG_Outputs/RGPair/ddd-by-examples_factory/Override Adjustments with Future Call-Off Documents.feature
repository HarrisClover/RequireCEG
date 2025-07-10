Feature: Override Adjustments with Future Call-Off Documents

  As a system user
  I want to receive notifications about discrepancies in demand forecasts when a call-off document is processed
  So that I can ensure accurate demand consistency and maintain effective record-keeping

  Background:
    Given the system has existing demand adjustments
    And a future call-off document is received

  Scenario: Scenario 1: Call-off document with earlier date
    Given a call-off document specifies a demand adjustment with a date earlier than the last adjustment
    When the system processes the call-off document
    Then the user receives a notification about the date conflict
    And the existing adjustment remains unchanged

  Scenario: Scenario 2: Call-off document with conflicting demand levels
    Given a call-off document with conflicting demand levels compared to existing adjustments
    When the system processes the call-off document
    Then the user is alerted of discrepancies in the conflicting demand levels
    And the previous adjustments are preserved

  Scenario: Scenario 3: Manual adjustments without call-off document
    Given there is no call-off document received
    When a user applies manual adjustments to today's demand
    Then the manual adjustments are accepted
    And all future demands can be adjusted without interference

  Scenario: Scenario 4: Processing a call-off document when no prior call-off document is present
    Given no call-off document is present
    When a call-off document is processed that specifies demand levels
    Then the system generates a notification to alert the user about discrepancies

  Scenario: Scenario 5: Manual adjustments when there's an incoming call-off document
    Given a future call-off document arrives after an adjustment has already been made
    When the system processes the call-off document
    Then the user is alerted to prioritize the details from the call-off document
    And the previous adjustments are ignored
