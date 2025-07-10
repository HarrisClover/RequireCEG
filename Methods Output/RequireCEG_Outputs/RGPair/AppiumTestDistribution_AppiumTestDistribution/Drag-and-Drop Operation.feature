Feature: Drag-and-Drop Operation

  As a user
  I want to drag and drop numbers and receive appropriate messages based on my selections
  So that I can interact effectively with the application and receive feedback on my actions

  Background:
    Given the user is logged into the system
    And the flag is set to false

  Scenario: Scenario 1: Selecting number 4 then number 3
    Given the user has clicked on number 4
    And the user then clicks on number 3
    When the user submits the selection
    Then the system should display message A

  Scenario: Scenario 2: Selecting number 1 then number 2
    Given the user has clicked on number 1
    And the user then clicks on number 2
    When the user submits the selection
    Then the system should display message B

  Scenario: Scenario 3: Selecting number 1 then number 3
    Given the user has clicked on number 1
    And the user then clicks on number 3
    When the user submits the selection
    Then the system should display message C

  Scenario: Scenario 4: Selecting number 1 and number 2 while flag is set
    Given the flag is set to true
    And the user clicks on number 1
    When the user clicks on number 2
    Then the system should display message D

  Scenario: Scenario 5: Prevent clicking on number 3 while flag is set
    Given the flag is set to true
    When the user attempts to click on number 3
    Then the system should prevent number 3 from being clickable

  Scenario: Scenario 6: Drag-and-drop delay
    Given the user initiates a drag-and-drop action
    When the user releases the item after dragging
    Then the system should confirm the successful operation after a delay of one second

  Scenario: Scenario 7: Prevent number 3 from being clicked if flag is set
    Given the flag is set to true
    And the user attempts to click on number 3
    Then the system should disable number 3 from being clickable
