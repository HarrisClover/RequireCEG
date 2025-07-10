Feature: Ensure Successful Upload Handling with Appropriate Responses

  As a user of the system
  I want to upload project data via the RESTful API
  So that I can successfully store relevant project information in the system

  Background:
    Given the user has valid project data
    And the user is authenticated

  Scenario: Scenario 1: Successful data upload
    Given the project data meets all required specifications
    When the user submits the data via the API
    Then the system responds with a 200 status code
    And the response body contains the relevant project information and a success message

  Scenario: Scenario 2: Incomplete data upload
    Given the project data is missing required fields
    When the user submits the data via the API
    Then the system responds with a 400 status code
    And the response body contains an error message indicating 'Missing required fields'

  Scenario: Scenario 3: Invalid data format
    Given the project data is in an invalid format
    When the user submits the data via the API
    Then the system responds with a 400 status code
    And the response body contains an error message indicating 'Invalid data format'

  Scenario: Scenario 4: Insufficient permissions
    Given the user does not have permission to upload project data
    When the user attempts to submit the data via the API
    Then the system responds with a 403 status code
    And the response body contains a message saying 'Permission denied for data upload'

  Scenario: Scenario 5: Unexpected internal error
    Given an internal error occurs while processing the upload
    When the user submits the project data via the API
    Then the system responds with a 500 status code
    And the response body contains a message 'An unexpected error occurred, please try again later'

  Scenario: Scenario 6: User attempts upload without valid data
    Given the user submits the data via the API
    When the input data is not valid and does not meet specifications
    Then the system responds with a 400 status code
    And the response body indicates the specific nature of the error

  Scenario: Scenario 7: User without permissions attempts upload
    Given the user attempts to upload project data via the API
    When the user does not have the necessary permissions to upload data
    Then the system responds with a 403 status code
    And the response body contains a message 'Permission denied for data upload'

  Scenario: Scenario 8: Unexpected internal error occurs
    Given the user submits project data via the API
    When an unexpected internal error occurs during the upload process
    Then the system responds with a 500 status code
    And the response body contains a message 'An unexpected error occurred, please try again later'
