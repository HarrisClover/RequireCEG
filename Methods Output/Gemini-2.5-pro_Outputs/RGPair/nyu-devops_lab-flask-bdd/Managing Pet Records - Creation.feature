Feature: Managing Pet Records - Creation
  As a Pet Store Owner
  I want to add new pet records to the system via the RESTful service
  So that I can keep the pet inventory up-to-date.

  Scenario Outline: Successfully Creating a New Pet Record
    Given the Pet Store service is running
    When a user sends a request to create a new pet with the following details:
      | Field        | Value        |
      | Name         | <Name>       |
      | Category     | <Category>   |
      | Availability | <Availability> |
      | Gender       | <Gender>     |
      | Birthday     | <Birthday>   |
    Then the system should respond with a success status indicating creation (e.g., HTTP 201 Created)
    And the response should contain a 'Success' message confirming pet creation
    And the newly created pet's details should be retrievable via its assigned ID

    Examples:
      | Name     | Category | Availability | Gender | Birthday   |
      | Buddy    | Dog      | Available    | Male   | 2023-01-15 |
      | Whiskers | Cat      | Available    | Female | 2022-11-01 |
      | Polly    | Bird     | Pending      | Female | 2023-05-20 |