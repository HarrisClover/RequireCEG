Feature: Check Compatibility of Girl Sizes for Boys

  As a parent or guardian of a child
  I want to verify the correct clothing sizes between boys and girls
  So that I can make appropriate purchases without confusion

  Background:
    Given a boy's size is within the range of 20 to 30
    And a girl's size is within the range of 20 to 25

  Scenario: Scenario 1: Boy's size within girl's range
    Given the boy's size is 22
    And the girl's size is 24
    When the purchase is attempted
    Then a notification should indicate that girl clothes can be purchased for the boy
    And the purchase should proceed without issues

  Scenario: Scenario 2: Girl's size within boy's range
    Given the girl's size is 21
    When the purchase is attempted
    Then a notification should indicate that boy clothes can be purchased for the girl

  Scenario: Scenario 3: Invalid sizes for both
    Given the boy's size is 35
    And the girl's size is 30
    When the purchase is attempted
    Then the system will notify the user that no suitable clothing sizes exist

  Scenario: Scenario 4: Mismatched sizes
    Given the boy's size is 25
    And the girl attempts to purchase clothes of size 30
    When the purchase is attempted
    Then the system will provide an error message stating that no clothes can be purchased

  Scenario: Scenario 5: Girl's size out of range and boy's size valid
    Given the boy's size is 28
    And the girl's size is 15
    When the purchase is attempted
    Then the system will provide an error message stating that no clothes can be purchased
