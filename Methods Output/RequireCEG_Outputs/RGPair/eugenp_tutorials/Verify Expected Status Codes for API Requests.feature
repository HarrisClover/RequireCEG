Feature: Verify Expected Status Codes for API Requests

  As a user
  I want to ensure that the system responds correctly to various API requests
  So that I can trust the functionality and reliability of the system

  Background:
    Given the system is running
    And the relevant APIs are accessible

  Scenario: Health Check API
    Given a user performs a GET request to the health check API
    When the system checks its operational status
    Then the response should have a 200 status code
    And the response body should confirm the operational status

  Scenario: Successful Project Data Upload
    Given the user provides project data with all required fields
    When the user uploads the project data using the RESTful API
    Then the system should return a 201 status code
    And the project data should be successfully created

  Scenario: Failed Project Data Upload
    Given the user provides project data with missing required fields
    When the user uploads the project data using the RESTful API
    Then the system should return a 400 status code
    And the response should indicate which fields are problematic

  Scenario: Retrieve Existing Project
    Given the specified project exists in the records
    When the user requests information for that project
    Then the system should return a 200 status code
    And the response should contain the relevant project details

  Scenario: Retrieve Non-Existing Project
    Given the specified project does not exist in the records
    When the user requests information for that non-existing project
    Then the system should return a 404 status code
    And the response should indicate that the requested project was not found

  Scenario: Valid Integer Inputs for Addition
    Given the user submits valid integer inputs for addition
    When the user requests the sum of the integers
    Then the system should return a 200 status code
    And the response should contain the correct sum

  Scenario: Invalid Inputs for Addition
    Given the user submits non-integer values for addition
    When the user requests the sum
    Then the system should return a 400 status code
    And the response should indicate valid integer inputs are required

  Scenario: Search for Existing Book
    Given the book exists in the database
    When the user searches for the book
    Then the system should return a 200 status code
    And the response should contain the book details

  Scenario: Search for Non-Existing Book
    Given the book does not exist in the database
    When the user searches for the non-existing book
    Then the system should return a 404 status code
    And the response should indicate that the book could not be located

  Scenario: Failed Project Data Upload Due to Missing Required Fields
    Given the user uploads project data with missing required fields
    When the system processes the upload
    Then the system must respond with a 400 status code
    And the response should detail which fields are missing
