Feature: Pet Store Management

  As a Pet Store Owner
  I want to manage pet records effectively and securely
  So that I can maintain accurate information about the pets in my store and ensure data integrity

  Background:
    Given the Pet Store Service is up and running
    And users have access to the functional home page with the title 'Pet Demo RESTful Service'

  Scenario: Scenario 1: Create a new pet entry
    Given the user is logged into the system
    When the user creates a new pet with valid Name, Category, Availability, Gender, and Birthday
    Then the system should display a 'Success' message
    And the new pet record should be saved in the system

  Scenario: Scenario 2: Create a new pet entry with invalid data
    Given the user is logged into the system
    When the user creates a new pet with invalid data
    Then the system should display an 'Error' message explaining the validation issue

  Scenario: Scenario 3: List all pets
    Given there are existing pet records in the system
    When the user requests to list all pets
    Then the system should return a list of all pets

  Scenario: Scenario 4: Search pets by category
    Given there are pets categorized as dogs in the system
    When the user searches for pets by the category 'dogs'
    Then the system should return all available dogs

  Scenario: Scenario 5: Filter available pets
    Given there are some pets available for adoption
    When the user filters by available pets
    Then the system should only show the pets that are available

  Scenario: Scenario 6: Update pet details
    Given the user selects a pet record to update
    When the user modifies the pet details with valid data
    Then the system should confirm the successful update with an appropriate message

  Scenario: Scenario 7: Update pet details with invalid data
    Given the user selects a pet record to update
    When the user modifies the pet details with invalid data
    Then the system should display an 'Error' message explaining the validation issue

  Scenario: Scenario 8: Retrieve pet data
    Given the user retrieves pet data by pet ID <pet-id>
    When the system fetches the pet details
    Then the pet data should maintain the correct state

  Scenario: Scenario 9: Retrieve pet data by non-existent pet ID
    Given the user retrieves pet data by pet ID 999
    When the system attempts to fetch the pet details
    Then the system should display an 'Error' message indicating that the pet was not found

  Scenario: Scenario 10: Delete a pet record
    Given the user is logged into the system
    When the user confirms deletion of the pet record
    Then the system should display a 'Success' message
    And the pet record should be removed from the system
