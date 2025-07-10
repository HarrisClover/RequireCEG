Feature: Validate Available Girl Sizes

  As a store owner
  I want to check the availability of clothing sizes for boys and girls
  So that I can ensure customers can purchase suitable clothing for their children

  Background:
    Given a boy's clothing size is between 20 and 30
    And a girl's clothing size is between 20 and 25

  Scenario: Scenario 1: Both sizes available
    Given the boy's size is 25
    And the girl's size is 22
    When the system checks the availability of the girl's size
    Then the girl's clothing is available
    And the boy's clothing can be purchased

  Scenario: Scenario 2: Girl's size unavailable
    Given the boy's size is 26
    And the girl's size is 21
    When the system checks the availability of the girl's size
    Then the system will output 'No girl's clothes available in the specified size'

  Scenario: Scenario 3: Both sizes unavailable
    Given the boy's size is 30
    And the girl's size is 26
    When the system checks the availability of both sizes
    Then the system will output 'No suitable sizes available for either the boy or girl and will not proceed with any purchase.'

  Scenario: Scenario 4: Girl's size confirmed unavailable
    Given the boy's size is 24
    And the girl's size is 23
    When the system checks the availability of the girl's size
    Then the girl's clothing size is confirmed to be unavailable
    And the system will output 'No suitable sizes available for either the boy or girl and will not proceed with any purchase.'

  Scenario: Scenario 5: Girl's size available with required fit
    Given the boy's size is 28
    And the girl's size is 24
    When the system checks the availability of the girl's size
    Then the girl's clothing is available
    And the girl's clothing size fits within the boy's size range
