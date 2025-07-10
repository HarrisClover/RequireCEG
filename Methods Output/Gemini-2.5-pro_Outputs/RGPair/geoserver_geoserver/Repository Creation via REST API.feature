Feature: Repository Creation via REST API
  As an API Client
  I want to create new GeoGig repositories via the REST API
  So that I can manage spatial data versioning programmatically.

  Scenario: Successfully create a new repository
    Given the GeoGig plugin API is running
    When I send a POST request to the repository creation endpoint with name "new-repo"
    Then the response status should be 201 Created
    And the response should contain information about the newly created "new-repo"

  Scenario: Attempt to create a repository that already exists
    Given a repository named "existing-repo" already exists
    When I send a POST request to the repository creation endpoint with name "existing-repo"
    Then the response status should be 409 Conflict
    And the JSON response body should indicate the reason "Repository already exists"

  Scenario: Attempt to create a repository that already exists, specifying a parent directory
    Given a repository named "existing-repo-with-parent" already exists
    And the request specifies a parent directory "/data/geogig"
    When I send a POST request to the repository creation endpoint with name "existing-repo-with-parent"
    Then the response status should be 409 Conflict
    And the JSON response body should indicate the reason "Repository already exists"