Feature: Dynamic Property Expansion
  As a user,
  I want to use dynamic properties within my requests,
  So that I can parameterize tests and reuse values across different requests or environments.

  Scenario: Use dynamic property in request parameter
    Given a project-level dynamic property named "baseURL" is defined with value "http://test.api.com"
    And the user is editing a request
    When the user sets the request URL to "${#Project#baseURL}/resource"
    And sends the request
    Then the actual request sent should target the URL "http://test.api.com/resource"
    And the expansion should be logged or traceable

  Scenario: Use dynamic property in request body
    Given a test case-level dynamic property named "customerId" is defined with value "cust-987"
    And the user is editing a POST request with a JSON body
    When the user sets the request body to '{"id": "${#TestCase#customerId}", "status": "pending"}'
    And sends the request
    Then the actual request body sent should be '{"id": "cust-987", "status": "pending"}'
    And the expansion should be logged or traceable