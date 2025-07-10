Feature: Managing Pet Records - Updates
  As a Pet Store Owner
  I want to update the details of existing pet records
  So that the information remains accurate (e.g., updating availability when a pet is sold).

  Scenario: Successfully Updating a Pet's Details
    Given the Pet Store service is running
    And a pet exists with ID "pet123" and details:
      | Name     | Category | Availability | Gender | Birthday   |
      | Fido     | Dog      | Available    | Male   | 2022-05-10 |
    When a user sends a request to update pet "pet123" with the following new details:
      | Field        | Value        |
      | Availability | Sold         |
      | Birthday     | 2022-05-11   | # Correcting birthday
    Then the system should respond with a success status (e.g., HTTP 200 OK)
    And the response should contain a message confirming the successful update
    And when retrieving pet "pet123" again
    Then its "Availability" should be "Sold"
    And its "Birthday" should be "2022-05-11"
    And its "Name", "Category", and "Gender" should remain unchanged unless specified in the update request