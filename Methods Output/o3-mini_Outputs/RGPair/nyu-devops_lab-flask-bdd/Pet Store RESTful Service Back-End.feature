Feature: Pet Store RESTful Service Back-End
  As a Pet Store Owner,
  I want a RESTful service to manage pet records,
  So that I can easily create, list, search, and update pet details while ensuring a smooth user experience.

  # Home Page Display
  Scenario: Verify the home page displays the correct title
    Given the pet store service is running
    When the user navigates to the home page
    Then the page should display the title "Pet Demo RESTful Service"
    And the page should not show any "404 Not Found" errors

  # Create a New Pet Entry
  Scenario: Create a new pet entry successfully
    Given the pet store service is running
    When the user enters pet details with the following information:
      | Field      | Value            |
      | Name       | "Buddy"          |
      | Category   | "Dogs"           |
      | Availability | "Available"    |
      | Gender     | "Male"           |
      | Birthday   | "2021-05-15"     |
    And the user submits the form
    Then the system should create the pet record
    And a "Success" message should be returned

  # List All Pets
  Scenario: List all pet entries
    Given that several pet records exist
    When the user requests to list all pets
    Then the system should return a list of all pet records

  # Search Pets by Category
  Scenario Outline: Search for pets by category
    Given that multiple pet records are created
    When the user searches for pets with the category "<Category>"
    Then the system should return only pet records where the category is "<Category>"

    Examples:
      | Category |
      | Dogs     |
      | Cats     |
      | Birds    |

  # Filter Available Pets
  Scenario: Filter to display only available pets
    Given that several pet records exist with various availability statuses
    When the user applies a filter for available pets
    Then the system should display only pet records with availability status "Available"

  # Update Pet Record
  Scenario: Update a pet record successfully
    Given a pet record with a unique pet ID exists
    When the user updates the pet details with new information:
      | Field      | New Value        |
      | Name       | "Charlie"        |
      | Category   | "Dogs"           |
      | Availability | "Unavailable"  |
      | Gender     | "Male"           |
      | Birthday   | "2021-05-15"     |
    And the user submits the update
    Then the system should update the pet record with the provided details
    And a message confirming the successful update should be returned

  # Form Field Reset After Operation
  Scenario: Verify form fields are cleared after an operation
    Given that a pet entry has been successfully created or updated
    When the user looks at the input fields on the pet entry form
    Then the fields should be cleared
    And any subsequent retrieval of pet data should reflect the most recent information based on the pet ID
