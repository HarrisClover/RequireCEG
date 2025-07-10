Feature: Data State Consistency
  As a Developer or Tester
  I want to ensure that pet data retrieved reflects the latest state after operations
  So that the system provides reliable and current information.

  Scenario: Retrieving Pet Data Reflects Current State
    Given the Pet Store service is running
    And a pet is created with Name "TempPet", Category "Test", Availability "Available" and receives ID "temp999"
    When a user sends a request to update pet "temp999", changing Availability to "Sold"
    And the update operation is successful
    When the user sends a request to retrieve the details for pet "temp999"
    Then the system should respond with a success status (e.g., HTTP 200 OK)
    And the retrieved pet data for "temp999" must show "Availability" as "Sold"
    And the other fields (Name, Category etc.) should reflect their state after the last successful operation (creation in this case).