Feature: Delay Mechanisms for Scenarios

  As a user
  I want to experience responsive interactions based on specific button clicks
  So that I receive timely feedback and messages from the application

  Background:
    Given a user is logged into the application
    And a specific flag can be set

  Scenario: Display Interaction A
    Given the user clicks on the number 4
    And the user clicks on the number 3
    When 1 second passes
    Then the system displays 'Interaction A'

  Scenario: Display Interaction B
    Given the user clicks on the number 1
    And the user clicks on the number 2
    When 1 second passes
    Then the system displays 'Interaction B'

  Scenario: Display Interaction C
    Given the user clicks on numbers 1 and 3
    When 1 second passes
    Then the system displays 'Interaction C'

  Scenario: Display Interaction D with Flag Set
    Given the specific flag is set
    And the user clicks on numbers 1 and 2
    When 1 second passes
    Then the system displays 'Interaction D'

  Scenario: Block Input for Number 3
    Given the specific flag is set
    When the user attempts to click on number 3
    Then the system does not accept input for number 3

  Scenario: Successful Drag-and-Drop Action
    Given the user has completed their interactions
    When the user performs a drag-and-drop action
    Then the drag-and-drop operation is executed successfully

  Scenario: Display Interaction D by Clicking 1 and 4 with Flag Set
    Given the specific flag is set
    When the user clicks on numbers 1 and 4
    Then the system displays 'Interaction D'

  Scenario: Interaction B Condition Check
    Given the user clicks on number 1
    And the user clicks on number 2
    When 1 second passes
    Then the system displays 'Interaction B'
