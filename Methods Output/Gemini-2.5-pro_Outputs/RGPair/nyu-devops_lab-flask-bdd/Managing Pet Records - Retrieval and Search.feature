Feature: Managing Pet Records - Retrieval and Search
  As a Pet Store Owner or Customer
  I want to retrieve pet records, search by category, and filter by availability
  So that I can view inventory or find specific pets.

  Scenario: Listing All Pets
    Given the Pet Store service is running
    And multiple pets exist in the system (e.g., a Dog named Buddy, a Cat named Whiskers)
    When a user sends a request to list all pets
    Then the system should respond with a success status (e.g., HTTP 200 OK)
    And the response should contain a list of all pet records
    And the list should include the details for "Buddy" and "Whiskers"

  Scenario Outline: Searching Pets by Category
    Given the Pet Store service is running
    And the following pets exist in the system:
      | Name     | Category | Availability | Gender | Birthday   |
      | Buddy    | Dog      | Available    | Male   | 2023-01-15 |
      | Max      | Dog      | Sold         | Male   | 2022-08-10 |
      | Whiskers | Cat      | Available    | Female | 2022-11-01 |
    When a user sends a request to search for pets with the category "<SearchCategory>"
    Then the system should respond with a success status (e.g., HTTP 200 OK)
    And the response should contain only pets belonging to the "<SearchCategory>"
    And the number of pets returned should be <ExpectedCount>

    Examples:
      | SearchCategory | ExpectedCount |
      | Dog            | 2             |
      | Cat            | 1             |
      | Fish           | 0             |

  Scenario Outline: Filtering Pets by Availability Status
    Given the Pet Store service is running
    And the following pets exist in the system:
      | Name     | Category | Availability | Gender | Birthday   |
      | Buddy    | Dog      | Available    | Male   | 2023-01-15 |
      | Max      | Dog      | Sold         | Male   | 2022-08-10 |
      | Whiskers | Cat      | Available    | Female | 2022-11-01 |
    When a user sends a request to filter pets by availability "<FilterAvailability>"
    Then the system should respond with a success status (e.g., HTTP 200 OK)
    And the response should contain only pets with the status "<FilterAvailability>"
    And the number of pets returned should be <ExpectedCount>

    Examples:
      | FilterAvailability | ExpectedCount |
      | Available          | 2             |
      | Sold               | 1             |
      | Pending            | 0             |