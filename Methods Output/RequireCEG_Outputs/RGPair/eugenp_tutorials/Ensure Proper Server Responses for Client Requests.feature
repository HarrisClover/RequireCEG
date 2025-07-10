Feature: Ensure Proper Server Responses for Client Requests

  As a client
  I want to receive appropriate status codes and responses from the server
  So that I can understand the health and functionality of the system

  Background:
    Given the server is operational
    And the client has valid credentials

  Scenario: Health Check API Response
    Given a client sends a request to the health check API
    When the server processes the request
    Then the server responds with a status code of 200
    And the response body confirms the current status of the system

  Scenario: Data Validation for Project Upload
    Given client uploads project data via the RESTful API
    When the server validates the integrity of the data
    Then if the data is valid, the server returns relevant project information
    And the response includes an appropriate status code indicating a successful operation

  Scenario: Querying for a Book
    Given a user queries for a book by title or author
    When the system checks the database
    Then if the book exists, the system returns the correct book details
    And if the book does not exist, the system returns a not found status code

  Scenario: Calculating Sum of Two Integers
    Given a user inputs two integers
    When the system computes the sum of those two integers
    Then the system accurately returns the sum

  Scenario: Version Information Access
    Given a user accesses any API endpoint that requests version information
    When the request is processed by the server
    Then the system provides the current version of the API
    And the response includes the appropriate status code confirming successful retrieval

  Scenario: Negative Case - Book Not Found
    Given a user queries for a book that does not exist
    When the system checks the database
    Then the system returns a not found status code
    And the response body indicates that the requested resource could not be located

  Scenario: Invalid Data Upload
    Given a client uploads invalid project data via the RESTful API
    When the server attempts to validate the integrity of the data
    Then the server returns a status code indicating failure
    And the response body contains error messages detailing the validation failures
