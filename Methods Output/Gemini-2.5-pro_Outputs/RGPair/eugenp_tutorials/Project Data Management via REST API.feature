Feature: Project Data Management via REST API
  As an API Client or Integrated System
  I want to upload and retrieve project data using RESTful APIs
  So that I can manage project information programmatically

  Scenario: Successfully upload new project data
    Given I have the following project data to upload:
      """
      {
        "projectName": "Phoenix Initiative",
        "status": "Active",
        "teamSize": 5
      }
      """
    When I send a POST request to the "/projects" endpoint with the project data
    Then the response status code should be 201 (Created)
    And the response should confirm successful upload
    And the response should contain the identifier for the newly created project

  Scenario: Retrieve existing project data
    Given a project with ID "proj_alpha_123" exists in the system
    When I send a GET request to the "/projects/proj_alpha_123" endpoint
    Then the response status code should be 200 (OK)
    And the response body should contain the project information for "proj_alpha_123" matching its stored details

  Scenario: Attempt to retrieve non-existent project data
    Given a project with ID "proj_beta_456" does not exist in the system
    When I send a GET request to the "/projects/proj_beta_456" endpoint
    Then the response status code should be 404 (Not Found)

