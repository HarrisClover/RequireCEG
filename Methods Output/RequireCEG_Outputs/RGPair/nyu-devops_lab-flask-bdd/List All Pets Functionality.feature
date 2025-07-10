Feature: List All Pets Functionality

  As a user
  I want to access the catalog service to view all pets
  So that I can see available pets to adopt or inquire about

  Background:
    Given the pet database is available
    And the user is on the pet catalog page

  Scenario: Scenario 1: No Pets Available
    Given the database has no pets
    When the user tries to view pets
    Then the system should display 'No pets available'
    And the home page remains operational, showing 'Pet Demo RESTful Service.'

  Scenario: Scenario 2: View Pets Successfully
    Given there are pets in the database
    When the user requests to view all pets
    Then the system should list each pet’s details including Name, Category, Availability, Gender, and Birthday

  Scenario: Scenario 3: Filter by Availability
    Given there are pets in the database with varying availability
    When the user filters by available pets
    Then the system should only display pets with an 'available' status

  Scenario: Scenario 4: Search by Category
    Given there are pets in the database belonging to various categories
    When the user searches for pets of the category 'dogs'
    Then the system should display only pets that belong to the 'dogs' category

  Scenario: Scenario 5: Data Retrieval Failure
    Given the pet database is unreachable
    When the user tries to view pets
    Then the system should not trigger a '404 Not Found' error
    And the home page should display 'Pet Demo RESTful Service.'

  Scenario Outline: Scenario Outline: Filter Reset After View
    Given the user has applied filters <filter>
    When the user finishes viewing pets
    Then the applied filters should be reset
    Examples:
      | filter |
      | availability |
      | category: dogs |


  Scenario: Scenario 6: Ensure Home Page Operational
    Given the database has no pets
    When the user tries to view pets
    Then the system should ensure the home page remains operational, showing 'Pet Demo RESTful Service.'

  Scenario: Scenario 7: User Interaction After View Operation
    Given the user interacts with the system after a view operation
    When the user tries to apply a filter
    Then the system should reset any applied filters or search criteria
