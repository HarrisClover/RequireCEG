Feature: Error Handling Display
  As a user
  I want to see a user-friendly error page when something goes wrong
  So that I understand there's a problem without seeing technical details.

  Scenario: Encountering a System Error
    Given an error occurs during application processing
    When the user experiences the error
    Then the user should be presented with a user-friendly error page
    And the error page should not display technical stack traces or sensitive information