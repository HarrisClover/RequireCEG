Feature: Upload Project Data through REST API

  As a user
  I want to upload project data to the system
  So that I can store and manage my project information efficiently

  Background:
    Given the user has valid project data
    And the user is authenticated

  Scenario: Scenario 1: Successful Data Upload
    Given the project data adheres to the specified schema
    And the required fields are present in the project data
    And the data types of the fields are correct according to the schema
    When the user sends a POST request to upload the project data
    Then the system stores the project information in the database
    And the system responds with a 200 status code and a success message with the project ID

  Scenario: Scenario 2: Invalid Data Format
    Given the project data has missing required fields
    When the user sends a POST request to upload the project data
    Then the system returns a 400 status code
    And the response details the nature of the issue as 'Missing Required Fields'

  Scenario: Scenario 3: Invalid Input Format
    Given the input format of the project data is invalid
    When the user sends a POST request to upload the project data
    Then the system returns a 400 status code
    And the response details the nature of the issue as 'Invalid Input Format'

  Scenario: Scenario 4: Retrieve Project Data
    Given the user has a valid project ID
    When the user sends a GET request to retrieve project data
    Then the system checks the database for the project ID
    And if the project ID exists, the system returns the project information with a 200 status code

  Scenario Outline: Scenario Outline: Project ID Not Found
    Given the user sends a GET request with project ID <project-id>
    When the system checks the database for the project ID
    Then the system responds with a 404 status code
    And the message indicates that 'Project Not Found'
    Examples:
      | project-id |
      | 12345 |
      | 67890 |
      | 111213 |

