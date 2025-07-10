Feature: Input Handling
  As a user
  I want the calculator to handle incorrect inputs gracefully
  So that I receive appropriate feedback without the application crashing

  Background:
    Given the calculator application is open and ready for use

  Scenario: Attempting Division by Zero
    When I enter the number "15"
    And I press the division button
    And I enter the number "0"
    And I press the equals button
    Then an appropriate error message like "Error: Cannot divide by zero" should be displayed
    And the calculator should be ready for new input