Feature: Match Returned Payloads with Specifications

  As a user
  I want to upload project data and ensure it meets predefined specifications
  So that I can successfully save project data without errors

  Background:
    Given the system is ready to accept API requests
    And the predefined specifications for project data are established

  Scenario: Scenario 1: Successful data upload
    Given the payload contains all required fields 'projectName', 'projectBudget', and 'projectDescription'
    And the data types for 'projectBudget' are correct and within maximum field lengths
    And the format of the 'startDate' and 'endDate' fields are correct
    And the 'endDate' field is later than the 'startDate' field
    When the user uploads the project data
    Then the system should return a 200 status code
    And the response body should include the project data in the expected format

  Scenario: Scenario 2: Missing required fields
    Given the payload is missing the projectName field
    When the user uploads the project data
    Then the system should return a 400 status code
    And the response should indicate 'Missing required field: projectName'

  Scenario: Scenario 3: Invalid data type
    Given the projectBudget field is not a valid number
    When the user uploads the project data
    Then the system should return a 400 status code
    And the response should indicate 'Invalid data type for field: projectBudget'

  Scenario: Scenario 4: Data retrieval of an existing project
    Given the project ID exists in the database
    When the user requests to retrieve the project data
    Then the system should return a 200 status code
    And the response body should include all relevant project details

  Scenario: Scenario 5: Data retrieval of a non-existing project
    Given the project ID does not exist in the database
    When the user requests to retrieve the project data
    Then the system should return a 404 status code
    And the response should indicate 'Project not found'

  Scenario: Scenario 6: endDate validation against startDate field format and order, using REQ relation of field requirements for project data upload instances and date validation conditions in a project upload use case where conditions apply for both endDate and startDate validation to be true, therefore they are mandatory to process the data creation task and cause a success response due to meeting requirements within defined project criteria and database entry situations.
    Given the payload contains the startDate and endDate fields
    And the endDate must be later than the startDate
    When the user uploads the project with validated dates in correct formats
    Then the system should validate the setup for project data submission
    And return a 200 status code for successful submission

  Scenario Outline: Scenario Outline: Validate payload against specifications
    Given the payload contains <field>
    And the field <type> is <validity>
    When the user uploads the project data
    Then the system should return <status code>
    And the response should indicate <message>
    Examples:
      | field | type | validity | status code | message |
      | projectName | required | missing | 400 | Missing required field: projectName |
      | projectBudget | number | invalid | 400 | Invalid data type for field: projectBudget |
      | projectID | existing | yes | 200 | Project data retrieved successfully |
      | projectID | existing | no | 404 | Project not found |

