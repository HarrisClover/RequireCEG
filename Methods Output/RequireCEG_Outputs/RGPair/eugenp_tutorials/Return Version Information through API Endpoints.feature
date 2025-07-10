Feature: Return Version Information through API Endpoints

  As a system administrator
  I want to retrieve the current version of the application via an API
  So that I can ensure the system is up to date and functioning correctly

  Background:
    Given the system is running and ready to process requests
    And the API endpoint for version information is available

  Scenario: Successful retrieval of version information with valid token
    Given a valid authorization token is provided
    When a GET request is made to the version endpoint
    Then the response should have a status code of 200
    And the response body should contain the current version, build date, and commit hash

  Scenario: Access denied due to missing authorization token
    Given no authorization token is provided
    When a GET request is made to the version endpoint
    Then the response should have a status code of 403
    And the response body should indicate that authorization is required

  Scenario: Version information not found due to endpoint issues
    Given the version endpoint is not reachable
    When a GET request is made to the version endpoint
    Then the response should have a status code of 404
    And the response body should clearly indicate that version information could not be located

  Scenario: Access denied due to invalid GET request
    Given the GET request is invalid
    When the request is processed
    Then the response should have a status code of 403
    And the response body should indicate that authorization is required

  Scenario: Version information inaccessible due to missing data
    Given the version information cannot be found or the endpoint is not reachable
    When a GET request is made to the version endpoint
    Then the response should have a status code of 404
    And the response body should indicate that the version information could not be located
