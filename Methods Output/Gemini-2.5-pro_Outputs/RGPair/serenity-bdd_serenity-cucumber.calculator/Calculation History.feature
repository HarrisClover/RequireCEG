Feature: Calculation History
  As a user
  I want the calculator to maintain a history of my entries and results
  So that I can refer back to previous calculations

  Background:
    Given the calculator application is open and ready for use

  Scenario: Viewing History After Calculations
    When I perform the calculation "5 + 3 =" resulting in "8"
    And I perform the calculation "10 * 2 =" resulting in "20"
    And I access the calculation history view
    Then the history should contain the entry "5 + 3 = 8"
    And the history should contain the entry "10 * 2 = 20"