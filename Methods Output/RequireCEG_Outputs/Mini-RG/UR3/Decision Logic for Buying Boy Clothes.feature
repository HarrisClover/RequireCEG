Feature: Decision Logic for Buying Boy Clothes

  As a store owner
  I want to allow customers to buy clothes based on size validation
  So that customers can find suitable clothing for boys and girls

  Background:
    Given the size of the boy is defined
    And the size of the girl is defined

  Scenario: Scenario 1: Valid boy size and valid girl size
    Given the boy's size is 25
    And the girl's size is 24
    When the system checks the sizes
    Then the system allows buying boy clothes
    And the system allows buying girl clothes

  Scenario: Scenario 2: Valid boy size within girl's range
    Given the boy's size is 22
    And the girl's size is 24
    When the system checks the sizes
    Then the system allows buying girl clothes

  Scenario: Scenario 3: Valid girl size within boy's range
    Given the boy's size is 28
    And the girl's size is 23
    When the system checks the sizes
    Then the system allows buying boy clothes

  Scenario: Scenario 4: Invalid sizes for both
    Given the boy's size is 35
    And the girl's size is 28
    When the system checks the sizes
    Then the system determines that no clothes should be purchased

  Scenario: Scenario 5: Boy's size not valid, girl's size valid
    Given the boy's size is 18
    And the girl's size is 24
    When the system checks the sizes
    Then the system determines that no clothes should be purchased

  Scenario: Scenario 6: Girl's size not valid, boy's size valid
    Given the boy's size is 26
    And the girl's size is 28
    When the system checks the sizes
    Then the system determines that no clothes should be purchased

  Scenario Outline: Scenario Outline: Size validation for buying clothes
    Given the boy's size is <boy_size>
    And the girl's size is <girl_size>
    When the system checks the sizes
    Then the system <expected_result>
    Examples:
      | boy_size | girl_size | expected_result |
      | 25 | 22 | allows buying boy clothes |
      | 23 | 26 | allows buying girl clothes |
      | 30 | 20 | allows buying boy clothes |
      | 18 | 27 | determines that no clothes should be purchased |

