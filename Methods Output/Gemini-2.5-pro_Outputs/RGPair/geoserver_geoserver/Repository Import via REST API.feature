Feature: Repository Import via REST API
  As an API Client
  I want to import existing repositories into GeoGig management via the REST API
  So that I can bring external or existing repositories under version control.

  Scenario Outline: Successfully import an existing repository
    Given an existing repository source is available at "<source_uri>"
    And the required backend resolver for the URI scheme is enabled
    And I request the response format "<format>"
    When I send a POST request to the repository import endpoint for "<new_repo_name>" from "<source_uri>"
    Then the response status should be 200 OK
    And the response body in "<format>" format should contain the details of the imported repository "<new_repo_name>"

    Examples:
      | source_uri                  | new_repo_name    | format |
      | file:///path/to/unmanaged   | imported-repo-1  | JSON   |
      | /local/filesystem/repo      | imported-repo-2  | XML    |
      | http://example.com/repo.git | imported-repo-3  | JSON   |


  Scenario: Attempt to import from a non-existent source repository
    Given the repository source "file:///path/to/nonexistent" does not exist
    When I send a POST request to the repository import endpoint for "failed-import-repo" from "file:///path/to/nonexistent"
    Then the response status should be 400 Bad Request
    # Or potentially 404 Not Found, depending on API design, requirement leans towards 400 based on other error types
    And the response body should indicate the error "Source repository not found or inaccessible"

  Scenario: Attempt to import using a disabled or unsupported backend resolver
    Given an existing repository source is available at "special-proto:///path/to/repo"
    And the backend resolver for the "special-proto" URI scheme is disabled
    When I send a POST request to the repository import endpoint for "failed-import-repo" from "special-proto:///path/to/repo"
    Then the response status should be 400 Bad Request
    And the response body should indicate the error "Unhandled URI type" or "Resolver not available"

  Scenario: Attempt to import a repository name that is already managed by GeoGig
    Given a repository named "already-managed-repo" is already managed by GeoGig
    And an existing repository source is available at "file:///path/to/source/data"
    When I send a POST request to the repository import endpoint for "already-managed-repo" from "file:///path/to/source/data"
    Then the response status should be 409 Conflict
    # Assuming import implies creation if name doesn't exist, thus conflict if it does.
    And the response body should indicate the reason "Repository already managed" or "Repository already exists"