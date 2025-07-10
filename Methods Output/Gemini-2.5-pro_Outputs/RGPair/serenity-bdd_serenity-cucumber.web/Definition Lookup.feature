Feature: Definition Lookup
  As a user
  I want to look up definitions for specific terms
  So that I can get accurate descriptions quickly.

  Scenario Outline: Looking up definitions for known terms
    Given I have access to the definition lookup feature
    When I request the definition for "<Term>"
    Then I should be presented with the correct definition for "<Term>"

    Examples:
      | Term  |
      | apple |
      | pear  |