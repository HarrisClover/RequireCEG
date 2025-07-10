Feature: Button Click Simulation

  As a user
  I want to understand how button clicks produce different messages based on input
  So that I can have a clear feedback mechanism for my interactions

  Background:
    Given a user is logged into the system
    And the user is located in a specific region

  Scenario: Scenario 1: Click numbers 1 and 2 without flag
    Given the flag is not set
    When the user clicks on numbers 1 and 2
    Then the system displays message 'A'

  Scenario: Scenario 2: Click numbers 2 and 3 without flag
    Given the flag is not set
    When the user clicks on numbers 2 and 3
    Then the system displays message 'B'

  Scenario: Scenario 3: Click numbers 1 and 3 without flag
    Given the flag is not set
    When the user clicks on numbers 1 and 3
    Then the system displays message 'C'

  Scenario: Scenario 4: Click numbers 1 and 2 with the flag set
    Given the flag is set
    When the user clicks on numbers 1 and 2
    Then the system displays message 'D'

  Scenario: Scenario 5: Click number 3 without flag and receive no message
    Given the flag is not set
    When the user clicks on number 3
    Then the system displays no message

  Scenario: Scenario 6: Click numbers 1 and 2 with the flag set and click numbers 2 and 3
    Given the flag is set
    When the user clicks on numbers 1 and 2, and also clicks on numbers 2 and 3
    Then the system displays message 'D' and subsequently message 'B'

  Scenario Outline: Scenario Outline: Drag-and-Drop Pricing
    Given the user is from <region>
    And the dragged item weighs <weight> kg
    When the user performs drag-and-drop action
    Then the price is set to <price>
    Examples:
      | region | weight | price |
      | USA | 10 | $11 |
      | USA | 20 | $11 |
      | Asia | 10 | $10 |
      | Asia | 15 | $12 |
      | Asia | 20 | $12 |
      | Europe | 5 | $15 |
      | Europe | 30 | $15 |

