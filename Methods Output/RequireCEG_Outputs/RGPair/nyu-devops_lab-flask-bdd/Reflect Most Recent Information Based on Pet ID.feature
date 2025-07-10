Feature: Reflect Most Recent Information Based on Pet ID

  As a pet store employee
  I want to retrieve and update pet information based on Pet ID
  So that I can provide accurate details and ensure the data is up-to-date

  Background:
    Given the system has a list of pets in the database
    And the user has access to the pet management interface

  Scenario: Retrieve existing pet information with valid Pet ID
    Given the user inputs a valid Pet ID
    When the user requests pet information
    Then the system displays the pet details
    And the details include Name, Category, Availability, Gender, and Birthday

  Scenario: Handle invalid Pet ID request
    Given the user inputs an invalid Pet ID
    When the user requests pet information
    Then the system responds with a '404 Not Found' error message

  Scenario: Update pet information successfully
    Given the user inputs a valid Pet ID and new information
    When the user submits the update request
    Then the system confirms the update with a 'Success' message
    And subsequent queries for that Pet ID reflect the most recent data

  Scenario: Ensure fields are cleared after displaying pet information
    Given the user inputs a valid Pet ID and submits the update request
    When the system confirms the update with a 'Success' message
    Then the system clears the input fields for future queries

  Scenario: Display pet details when valid Pet ID is queried
    Given the user inputs a valid Pet ID
    When the user queries for pet information
    Then the system displays the pet's details including Name, Category, Availability, Gender, and Birthday

  Scenario Outline: Validate information for multiple Pet IDs
    Given the user inputs a Pet ID <pet-id>
    And the database has a record for the Pet ID <pet-id>
    When the user requests information
    Then the system returns the pet details for <pet-id>
    Examples:
      | pet-id |
      | 001 |
      | 002 |
      | 003 |

