Feature: Feedback on Interaction Success

  As a user
  I want to receive appropriate messages based on the numbers I click
  So that I can understand the system's response to my interactions

  Background:
    Given the user is logged into the system
    And the system is set up to display specific messages for number clicks

  Scenario: Scenario 1: Clicks 4 and 3
    Given the user clicks on numbers 4 and 3
    Then the system displays message A

  Scenario: Scenario 2: Clicks 1 and 2
    Given the user clicks on numbers 1 and 2
    Then the system displays message B

  Scenario: Scenario 3: Clicks 2 and 3
    Given the user clicks on numbers 2 and 3
    Then the system displays message C

  Scenario: Scenario 4: Clicks 1 and 3 with flag set
    Given the specific flag is set to true
    When the user clicks on numbers 1 and 3
    Then the system displays message D

  Scenario: Scenario 5: Clicks 1 and 3 with flag not set
    Given the specific flag is not set
    When the user clicks on number 3
    Then no message will be displayed

  Scenario: Scenario 6: Drag and drop after clicking 4 and 3
    Given the user has clicked on numbers 4 and 3
    When the user performs a drag-and-drop action
    Then the system displays a message indicating the drag-and-drop has been recognized

  Scenario: Scenario 7: Clicks 1 and 3 while the flag is not set
    Given the specific flag is not set
    When the user clicks on number 3
    Then no message will be displayed

  Scenario: Scenario 8: Clicks 4 and 3 AND 1 and 2
    Given the user clicks on numbers 4 and 3 and 1 and 2
    Then the system displays message A and message B
