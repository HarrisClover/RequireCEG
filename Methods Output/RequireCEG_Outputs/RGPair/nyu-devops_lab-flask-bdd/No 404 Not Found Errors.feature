Feature: Pet Record Management

  As a user
  I want to interact with a pet management system without encountering errors
  So that I can smoothly create, update, and search for pet records

  Background:
    Given the user is on the home page
    And the title displayed is 'Pet Demo RESTful Service'

  Scenario: Creating a New Pet with All Fields Filled
    Given the user has filled in all required fields (Name, Category, Availability, Gender, and Birthday)
    When the user attempts to create a new pet entry
    Then the system successfully creates the pet record
    And a confirmation message stating 'Success' is displayed

  Scenario: Creating a New Pet with Missing Required Fields
    Given the user has left one or more required fields empty
    When the user attempts to create a new pet entry
    Then the system displays an error message prompting the user to complete all fields
    And the pet record is not created

  Scenario: Searching for Pets Using a Non-Existent Category
    Given the user searches for pets with a non-existent category
    When the search is executed
    Then the system notifies the user with a message indicating that no pets were found

  Scenario: Updating a Pet Record with a Non-Existent ID
    Given the user attempts to update an existing pet record with a non-existent pet ID
    When the update request is sent
    Then the system issues a message stating that the pet record could not be found

  Scenario: Attempting to Create a Pet Record Without Fields Filled
    Given the user has not filled any required fields
    When the user attempts to create a new pet entry
    Then the system does not create the pet record
    And the system displays an error message prompting the user to complete all fields

  Scenario: Attempting to Create a Pet Record With Required Fields Empty
    Given the user has left critical required fields empty
    When the user attempts to create a new pet entry
    Then the system displays an error message indicating that required fields must be completed

  Scenario: Searching for Pets Using a Non-Existent ID
    Given the user searches for pets using a non-existent ID
    When the search is executed
    Then the system notifies the user with a message that no pets were found
