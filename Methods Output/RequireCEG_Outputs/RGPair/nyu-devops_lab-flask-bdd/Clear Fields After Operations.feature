Feature: Clear Fields After Operations

  As a pet owner
  I want to ensure that input fields are cleared after operations
  So that I can enter new pet information without confusion

  Background:
    Given the user is logged into the pet management system
    And the user has access to create, update, and retrieve pet records

  Scenario: Scenario 1: Creating a new pet entry
    Given the user fills in the Name, Category, Availability, Gender, and Birthday fields
    When the user submits the new pet entry
    Then the system should clear the input fields for Name, Category, Availability, Gender, and Birthday
    And the system should display a success message indicating the pet was created

  Scenario: Scenario 2: Updating an existing pet record
    Given the user selects a pet record to update
    When the user confirms the successful update of the pet record
    Then the system should clear the corresponding input fields
    And the system should display a success message indicating the record was updated

  Scenario: Scenario 3: Retrieving pet data by ID
    Given the user inputs a pet ID to retrieve data
    When the system populates the fields with the pet's information
    Then the system should clear the fields after displaying the information

  Scenario: Scenario 4: Attempting actions without clearing fields first
    Given the user tries to create a new entry or update without clearing the fields
    Then the system should present a reminder message indicating that the fields must be cleared before proceeding

  Scenario: Scenario 5: Confirming input fields are cleared after creation
    Given the user has successfully created a new pet entry
    When the user checks the input fields
    Then the input fields for Name, Category, Availability, Gender, and Birthday should be empty
    And the system should confirm that these fields are cleared

  Scenario: Scenario 6: Confirming input fields are cleared after updating
    Given the user has confirmed a successful update of an existing pet record
    When the user checks the input fields
    Then the corresponding input fields should be empty
    And the system should confirm that these fields are cleared

  Scenario: Scenario 7: REQ checks for operations on creating and updating pet entries
    Given the user has successfully created a new pet entry
    When the user has confirmed a successful update of an existing pet record
    Then both operations must occur simultaneously
