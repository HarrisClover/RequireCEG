Feature: Search Pets by Category

  As a pet owner or potential adopter
  I want to find available pets in specific categories
  So that I can easily identify pets that I may want to adopt

  Background:
    Given the user is on the pet adoption system
    And the available categories are 'dogs' and 'cats'

  Scenario: Scenario 1: Search for Dogs
    Given the user selects the 'dogs' category
    When the user clicks the search button
    Then the system displays all available dogs with their details
    And the details include Name and Availability

  Scenario: Scenario 2: Search for Cats
    Given the user selects the 'cats' category
    When the user clicks the search button
    Then the system displays all available cats with their details
    And the details include Name and Availability

  Scenario: Scenario 3: Search with Invalid Category
    Given the user selects an invalid category
    When the user clicks the search button
    Then the system returns an error message stating 'No pets found for the selected category.'

  Scenario: Scenario 4: Search Without Category
    Given the user has not selected a category
    When the user attempts to perform a search
    Then the system prompts the user to select a valid category before proceeding with the search.

  Scenario: Scenario 5: Search Both Categories
    Given the user has selected both 'dogs' and 'cats' categories
    When the user clicks the search button
    Then the system returns an error message stating 'No pets found for the selected category.'
