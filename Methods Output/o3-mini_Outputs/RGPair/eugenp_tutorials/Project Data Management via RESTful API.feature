Feature: Project Data Management via RESTful API
  As a project manager,
  I want to upload and retrieve project data via RESTful API
  So that I can manage project information effectively

  Scenario: Uploading project data successfully
    Given a valid project data payload
    When a POST request is made to the project data upload endpoint
    Then the response status code should indicate success
    And the response should contain a confirmation message

  Scenario: Retrieving project data successfully
    Given a project exists in the system
    When a GET request is made to the project data retrieval endpoint
    Then the response status code should indicate success
    And the response should contain the relevant project details

