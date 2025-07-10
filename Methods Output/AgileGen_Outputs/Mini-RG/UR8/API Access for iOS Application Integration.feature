Feature: API Access for iOS Application Integration
  As a developer,
  I want to access an API from the website,
  So that I can integrate it and implement certain features in my iOS application.

  Scenario Outline: Accessing API with Different Conditions
    Given I want to access the API
    When I provide the API access key "<access-key>"
    And the access key is "<access-key-status>"
    Then I should "<expected-result>"

  Examples:
    | access-key         | access-key-status       | expected-result                       |
    | valid-key          | valid                   | be able to access the API            |
    | valid-key          | expired                 | not be able to access the API        |
    | valid-key          | wrong                   | not be able to access the API        |
    | expired-key        | valid                   | not be able to access the API        |
    | incorrect-key      | valid                   | not be able to access the API        |
    | valid-key-with-permission | valid           | be able to access the API            |
