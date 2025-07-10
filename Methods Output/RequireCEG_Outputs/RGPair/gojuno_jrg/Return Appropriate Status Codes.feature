Feature: Return Appropriate Status Codes

  As a user
  I want the system to validate geographic coordinates and return appropriate status codes
  So that I can receive helpful responses based on my input

  Background:
    Given the system is running and ready to process inputs
    And the user has access to the input interface

  Scenario: Scenario 1: Invalid Input Format
    Given a user inputs non-numeric values
    When the input is validated
    Then the system should return a status code of 400
    And the message 'Input format is incorrect.' should be displayed

  Scenario: Scenario 2: Location Not Found
    Given a user inputs valid numeric coordinates that are outside New York and neighboring states boundaries
    When the system checks the geographical boundaries
    Then the system should return a status code of 404
    And the message 'Location not found.' should be displayed

  Scenario: Scenario 3: Multiple Locations Found
    Given a user inputs valid coordinates that match multiple locations
    When the system processes the coordinates
    Then the system should return a status code of 206
    And the user should be prompted to refine their search

  Scenario: Scenario 4: Rate Limit Exceeded
    Given the user exceeds the allowed rate limit of requests
    When the system receives a new request from the user
    Then the system should return a status code of 429
    And the message 'Try again later.' should be displayed

  Scenario: Scenario 5: Internal Processing Error
    Given the system encounters an unexpected issue during processing
    When the user submits a valid request
    Then the system should return a status code of 500
    And the message 'An unexpected issue has occurred.' should be displayed

  Scenario: Scenario 6: Geographic Boundary Not Validated
    Given a user inputs valid numeric coordinates
    When the coordinates are determined to fall outside the defined geographical boundaries
    Then the system should return a status code of 404
    And the message 'Location not found.' should be displayed
