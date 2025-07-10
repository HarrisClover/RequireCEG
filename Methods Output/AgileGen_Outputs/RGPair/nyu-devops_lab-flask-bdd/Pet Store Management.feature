Feature: Pet Store Management
As a Pet Store Owner,
I want to manage pet records effectively
So that I can track and maintain pet information seamlessly.

Scenario: Display Home Page
Given that the pet store service is running
When a user visits the homepage
Then the page should display the title "Pet Demo RESTful Service"
And the page should not display any "404 Not Found" errors

Scenario: Create New Pet Entry
Given that the user is logged in to the system
When the user submits a new pet entry with the following details:
  | Name    | Category | Availability | Gender | Birthday   |
  | Fluffy  | Dog      | Available    | Male   | 2019-03-10 |
Then the system should create the pet record
And the system should display a "Success" message

Scenario: List All Pets
Given that the user is logged in to the system
When the user requests the list of all pets
Then the system should return a list of all pet records

Scenario: Search Pets by Category
Given that the user is logged in to the system
When the user searches for pets by category "Dog"
Then the system should return a list of pets in the "Dog" category

Scenario: Filter Available Pets
Given that the user is logged in to the system
When the user filters pets by availability "Available"
Then the system should return only available pets

Scenario: Update Pet Record
Given that the user is logged in to the system
And the user has an existing pet record with ID "123"
When the user updates the pet details with the following information:
  | Name     | Category | Availability | Gender | Birthday   |
  | Sparky   | Dog      | Sold         | Male   | 2018-06-20 |
Then the system should update the pet record with ID "123"
And the system should display a "Success" message

Scenario: Maintain Correct State After Operations
Given that the user has updated a pet's details
When the user retrieves the pet record using its ID
Then the system should return the most recent pet data
And all fields should reflect the updated information
And the system should clear any temporary fields after the operation
