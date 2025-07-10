Feature: Accurate Search Result Handling

  As a pet owner
  I want to search for pets by category or name
  So that I can find available pets that meet my needs

  Background:
    Given the pet records are up to date
    And the system supports search by category and name

  Scenario: Scenario 1: Search by valid category
    Given the user specifies the category 'dogs'
    When the user requests a pet search
    Then the system filters and returns pets that belong to the 'dogs' category
    And all returned pets should be marked as available

  Scenario: Scenario 2: Search by name without category
    Given the user enters the name 'Buddy'
    When the user requests a pet search
    Then the system returns pets that match the provided name regardless of category
    And all returned pets should be marked as available

  Scenario: Scenario 3: Search by invalid category
    Given the user specifies an invalid category 'catsdogs'
    When the user requests a pet search
    Then the response should be 'Invalid category, please try again'

  Scenario: Scenario 4: Search by category with no pets available
    Given the user specifies the category 'birds'
    When the user requests a pet search
    Then the response should be 'No pets found in this category'

  Scenario: Scenario 5: Search with available private data and public data
    Given the user specifies the category 'dogs'
    And the pets being searched for are marked as available
    When the user requests a pet search
    Then the system ensures that only available pets are displayed in the search results
