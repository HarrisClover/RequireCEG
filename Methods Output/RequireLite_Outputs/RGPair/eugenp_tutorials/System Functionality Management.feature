Feature: System Functionality Management

  As a system administrator
  I want to manage user accounts and functionalities effectively
  So that the system can operate smoothly and meet user needs

  Background:
    Given the system is operational
    And the necessary frameworks are in place

  Scenario: User Account Management
    Given a user account is created
    When a credit transaction of $50 is performed using a verified transaction method
    Then the account balance should be $50
    And the transaction details should reflect the correct amount

  Scenario: Health Check API Status
    When a health check request is made
    Then the API should respond with a 200 status code
    And the response should include a message indicating the service is healthy

  Scenario: Random Number Generation
    Given the user inputs desired limits of 1 and 100 as integers
    When the random number generator is triggered
    Then the returned number should be within the specified range
    And invalid inputs should return an error message

  Scenario: Data Upload and Retrieval
    Given sample project data is prepared for upload
    When the data is submitted via the RESTful API
    Then the system should confirm successful data handling
    And the system should allow retrieval of the uploaded project information with the correct format

  Scenario: Calculator Functionality
    Given two integers 5 and 7 are provided
    When the addition operation is performed
    Then the result should be 12
    And errors due to non-integer inputs should return a validation message

  Scenario: Book Store Search
    Given books titled 'Harry Potter' and 'The Hobbit' are in the system
    When a search is performed with the title 'Harry Potter'
    Then the search result should include 'Harry Potter'
    And querying for a non-existing title should return an empty result set

  Scenario Outline: API Endpoint Validation
    Given the API endpoint <endpoint> is accessed
    When the <method> request is made with valid parameters
    Then the response should return a <status-code>
    And the payload should match the expected structure and include necessary attributes
    Examples:
      | endpoint | method | status-code | expected structure |
      | /health | GET | 200 | message: 'Healthy' |
      | /projects | POST | 201 | project_id: '123', status: 'created' |
      | /users | GET | 200 | users: Array of user objects |


  Scenario: Version Information Retrieval
    When the version endpoint is called
    Then the system should return necessary version information
    And the response should include the version number and release date
