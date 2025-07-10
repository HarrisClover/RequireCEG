Feature: Select Hogwarts House

  As a wizarding school user
  I want to select one Hogwarts house at a time and have the system assign traits and display the house emblem accordingly
  So that my profile correctly reflects the selected house with its traits and emblem

  Background:
    Given the user is logged into the system
    And the system has the four valid Hogwarts houses defined: Gryffindor, Hufflepuff, Ravenclaw, and Slytherin

  Scenario: Selecting Gryffindor assigns corresponding traits and displays emblem when only one house is selected
    Given the user has not selected any house
    When the user selects Gryffindor as their house
    And only one house is selected
    Then the user profile is assigned the traits bravery and courage
    And the Gryffindor emblem is displayed prominently on the user interface

  Scenario: Selecting Hufflepuff assigns corresponding traits and displays emblem when only one house is selected
    Given the user has not selected any house
    When the user selects Hufflepuff as their house
    And only one house is selected
    Then the user profile is assigned the traits loyalty and hard work
    And the Hufflepuff emblem is displayed prominently on the user interface

  Scenario: Selecting Ravenclaw assigns corresponding traits and displays emblem when only one house is selected
    Given the user has not selected any house
    When the user selects Ravenclaw as their house
    And only one house is selected
    Then the user profile is assigned the traits intelligence and wisdom
    And the Ravenclaw emblem is displayed prominently on the user interface

  Scenario: Selecting Slytherin assigns corresponding traits and displays emblem when only one house is selected
    Given the user has not selected any house
    When the user selects Slytherin as their house
    And only one house is selected
    Then the user profile is assigned the traits ambition and cunning
    And the Slytherin emblem is displayed prominently on the user interface

  Scenario: Selecting a house that is not Gryffindor, Hufflepuff, Ravenclaw, or Slytherin shows error and does not assign traits or emblem
    Given the user has not selected any house
    When the user selects a house named 'Durmstrang'
    Then the system displays an error message indicating invalid house selection
    And no traits or emblem are assigned or displayed on the user profile

  Scenario: Only one house can be selected at a time; selecting a new house updates traits and emblem accordingly
    Given the user has selected Gryffindor as their house
    When the user selects Ravenclaw as their new house
    And only one house is selected
    Then the user profile traits are updated to intelligence and wisdom
    And the Ravenclaw emblem is displayed prominently on the user interface
    And the Gryffindor emblem is removed

  Scenario: System prevents selecting multiple valid houses simultaneously
    Given the user has not selected any house
    When the user attempts to select multiple houses among Gryffindor, Hufflepuff, Ravenclaw, or Slytherin at the same time
    Then the system does not allow multiple house selections
    And an appropriate message is displayed indicating that only one house may be selected at a time
