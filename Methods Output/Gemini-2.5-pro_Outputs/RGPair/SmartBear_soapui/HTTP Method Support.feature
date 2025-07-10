Feature: HTTP Method Support
  As a user,
  I want the application to support various standard HTTP methods for requests,
  So that I can test different types of API interactions.

  Scenario Outline: Verify support for standard HTTP methods
    Given an existing REST Mock Service "Generic API"
    When the user creates a mock resource "/data" supporting the <HttpMethod> method with a specific response
    And the user creates and sends a request using the <HttpMethod> method to "/data"
    Then the mock service should correctly match the <HttpMethod>
    And return the configured response
    And the interaction using <HttpMethod> should be logged

    Examples:
      | HttpMethod |
      | GET        |
      | POST       |
      | PUT        |
      | DELETE     |
      | PATCH      |
      | OPTIONS    |
      | HEAD       |