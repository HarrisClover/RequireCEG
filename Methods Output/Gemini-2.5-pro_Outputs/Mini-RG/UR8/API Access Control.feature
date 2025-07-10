Feature: API Access Control
  As a developer,
  I want to access the website's API under different authentication conditions
  So that I can securely integrate its features into my iOS application.

  Scenario: Successful access to a free API
    Given the API endpoint is configured for free access
    When I attempt to access the API endpoint without an API key
    Then I should receive a successful response (e.g., status code 200)
    And I should be able to retrieve the API data

  Scenario: Successful access with a valid API key
    Given the API endpoint requires authentication
    And I have a valid API access key
    When I attempt to access the API endpoint using my valid key
    Then I should receive a successful response (e.g., status code 200)
    And I should be able to retrieve the API data

  Scenario: Access denied due to an expired API key
    Given the API endpoint requires authentication
    And I have an API access key that has expired
    When I attempt to access the API endpoint using the expired key
    Then I should receive an unauthorized response (e.g., status code 401 or 403)
    And the response should indicate the key is expired

  Scenario: Access denied due to a wrong API key
    Given the API endpoint requires authentication
    And I provide an incorrect or invalid API access key
    When I attempt to access the API endpoint using the wrong key
    Then I should receive an unauthorized response (e.g., status code 401 or 403)
    And the response should indicate the key is invalid

  Scenario: Successful access with a valid key having correct permissions
    Given the API endpoint requires authentication and specific permissions (e.g., 'read_data')
    And I have a valid API access key with the required 'read_data' permission
    When I attempt to access the API endpoint using my key
    Then I should receive a successful response (e.g., status code 200)
    And I should be able to retrieve the API data

  Scenario: Access denied due to insufficient permissions
    Given the API endpoint requires authentication and specific permissions (e.g., 'write_data')
    And I have a valid API access key but it only has 'read_data' permission
    When I attempt to access the API endpoint using my key
    Then I should receive a forbidden response (e.g., status code 403)
    And the response should indicate insufficient permissions

  Scenario: Access denied for a non-free API without providing a key
    Given the API endpoint requires authentication (is not free)
    When I attempt to access the API endpoint without providing any API key
    Then I should receive an unauthorized response (e.g., status code 401)
    And the response should indicate an API key is required