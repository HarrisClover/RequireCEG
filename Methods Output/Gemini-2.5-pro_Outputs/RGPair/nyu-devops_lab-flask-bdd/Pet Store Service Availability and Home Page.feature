Feature: Pet Store Service Availability and Home Page
  As a System Administrator or User
  I want to ensure the Pet Store service is running and accessible
  So that pet management functionalities can be used.

  Scenario: Accessing the Service Home Page
    Given the Pet Store service backend is deployed and running
    When a user accesses the service's root endpoint
    Then the system should respond with a success status (e.g., HTTP 200 OK)
    And the response should contain the title 'Pet Demo RESTful Service'
    And the response should not indicate a '404 Not Found' error