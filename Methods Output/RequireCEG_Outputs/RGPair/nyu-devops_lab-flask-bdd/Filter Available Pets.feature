Feature: Filter Available Pets

  As a pet adoption center staff
  I want to display available pets for adoption
  So that customers can choose from pets that are currently available

  Background:
    Given that there are records of pets in the system
    And some pets are marked as available for adoption

  Scenario: Scenario 1: No available pets
    Given that there are no available pets in the records
    When a user requests to view available pets
    Then the system should present a message stating 'There are currently no available pets.'

  Scenario: Scenario 2: View available pets without category
    Given that there are pets available for adoption
    When a user requests to view available pets
    Then the system should display a list of available pets for adoption.

  Scenario: Scenario 3: Filter pets by category
    Given that a user specifies a category to filter, such as dogs
    When the user searches for pets in that category
    Then the system should display the filtered list of available pets in the 'dogs' category.

  Scenario: Scenario 4: No pets available in chosen category
    Given that the user specifies a category with no available pets
    When the user searches for pets in that category
    Then the system should return a message saying 'No pets are available in the chosen category.'

  Scenario: Scenario 5: Filter pets with multiple conditions
    Given that there are records of pets in the system
    And the user specifies a category to filter available pets and confirms there are pets in that category
    When the user searches for pets in that category
    Then the system should display the filtered list of available pets based on the specified category.
