Feature: First Name Entry in Homerunner Form

  As a user filling out the Homerunner form
  I want to only fill in the first name when the family name is not required
  So that I can proceed without unnecessary obstacles

  Background:
    Given the user opens the Homerunner form

  Scenario: Hiding Family Name Field
    Given the user has filled out their first name while leaving the family name field empty
    Then the system hides the family name field from the user's view

  Scenario: Proceeding Without Family Name
    Given the user has left the family name field empty
    When the user tries to proceed with their submission
    Then the system allows the user to proceed without presenting any error or obstruction
