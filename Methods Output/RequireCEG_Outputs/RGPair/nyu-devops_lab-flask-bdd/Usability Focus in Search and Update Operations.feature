Feature: Usability Focus in Search and Update Operations

  As a store owner
  I want to manage pet records effectively through search and update operations
  So that I can ensure customers have access to the latest pet information and facilitate a seamless user experience

  Background:
    Given the user is on the home page titled 'Pet Demo RESTful Service'
    And no '404 Not Found' errors occur during navigation

  Scenario: Create a new pet entry
    Given the user inputs valid details for a new pet including Name, Category, Availability, Gender, and Birthday
    When the user submits the new pet entry
    Then the system should display a 'Success' message
    And the new pet record should be added to the list of all pets

  Scenario: Search for pets by category
    Given the user has entered a category such as 'dogs'
    When the user performs a search for pets
    Then the system should return a filtered list that accurately reflects only those pets that match the specified category

  Scenario: Filter pets by availability
    Given the user requests pets that are available
    When the user applies the availability filter
    Then the returned results should exclusively include pets marked as available

  Scenario: Update a pet record
    Given the user selects a pet to update
    When the user applies new details to the pet record
    Then the system should respond with a confirmation message indicating a successful update

  Scenario: Retrieve pet information by ID
    Given the user has the ID of a pet
    When the user requests pet information using the ID
    Then the system should display the most current details available for that pet

  Scenario: Error handling when home page is inaccessible
    Given the user attempts to access the home page
    When the home page is not found
    Then the system should display '404 Not Found' error message

  Scenario: Successful pet entry creation upholds the system state
    Given the user has submitted a new pet entry with valid details
    When the submission is successful
    Then the system should retain the added pet in its database
    And the system should ensure all pet records show accurate information post submission

  Scenario: Display search results after a pet entry is created
    Given the user has just created a new pet entry
    When the user searches for the created pet's category
    Then the system should display the newly created pet in the search results
