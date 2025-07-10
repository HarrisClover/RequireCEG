Feature: Restrict Adjustments to Today's and Future Demands

  As a system user
  I want to ensure that adjustments can only be made for today or future demands
  So that we maintain integrity in demand management and avoid conflicts

  Background:
    Given the current date is set in the system
    And the demand adjustment request is submitted

  Scenario: Past Date Adjustment Request
    Given the user submits a request for a past date
    When the system processes the request
    Then the system should throw an error message
    And the message states 'Adjustments can only be made for today or future demands.'

  Scenario: Today's Adjustment Request
    Given the user submits a request for today's date
    When the system processes the request
    Then the system should log the change for future reference
    And an event indicating that the demanded levels have changed should be triggered

  Scenario: Future Date Adjustment Request
    Given the user submits a request for a future date
    When the system processes the request
    Then the system should log the change for future reference
    And the system should check against existing future call-off documents

  Scenario: Conflict with Future Call-Off Document
    Given a future call-off document exists after an adjustment
    When the user is notified of the new call-off submission
    Then the system should state that the call-off document will automatically override the previous adjustment
    And the user can specify whether to retain the previous adjustment

  Scenario: Retain Previous Adjustment Decision
    Given the customer opts not to retain the previous adjustment in favor of the new call-off document
    When the system evaluates the customer's choice
    Then the system should log the customer's choice to retain the previous adjustment
    And the system should maintain the previous adjustment in the records

  Scenario Outline: Scenario Outline: Adjusting Future Demands
    Given the adjustment request is for <request-date>
    When the system processes the adjustment
    Then the system should <expected-outcome>
    And the system should <additional-outcome>
    Examples:
      | request-date | expected-outcome | additional-outcome |
      | 2023-10-01 | log the adjustment | trigger an event |
      | 2023-10-02 | log the adjustment | check existing calls |
      | 2023-10-03 | override previous adjustment | log user response |

