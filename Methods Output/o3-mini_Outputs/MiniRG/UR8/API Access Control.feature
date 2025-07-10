Feature: API Access Control
  As a developer,
  I want to access an API from the website
  So that I can integrate it and implement features in my iOS application

  Scenario: Accessing the API with free access
    Given the API is available for free access
    When I make a request to the API endpoint without an API access key
    Then I should be able to access the API

  Scenario: Accessing the API with a valid API key
    Given I have a valid API access key
    And the API access key has the correct permissions
    When I make a request to the API endpoint using the valid key
    Then I should be able to access the API

  Scenario: Denied access when the API key has expired
    Given I have an expired API access key
    When I attempt to make a request to the API endpoint using the expired key
    Then I should not be able to access the API

  Scenario: Denied access when the API key is incorrect
    Given I have an incorrect API access key
    When I attempt to make a request to the API endpoint using the incorrect key
    Then I should not be able to access the API

  Scenario: Accessing the API with correct permissions
    Given I have an API access key that is valid and active
    And the API access key contains the required permissions
    When I make a request to the API endpoint
    Then I should receive a successful response
