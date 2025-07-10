Feature: Recommend Girl Clothing Sizes

  As a customer looking for clothing
  I want to receive clothing size recommendations based on my input size
  So that I can easily find suitable clothing options for myself or others

  Background:
    Given the system has a database of available clothing sizes for boys and girls
    And the customer inputs a clothing size

  Scenario: Scenario 1: Boy's size input within range 20-30
    Given the customer inputs a boy's size 22
    When the system checks for available girl clothing sizes
    Then the system recommends girl clothing sizes within the range of 20 to 25
    And provides an option to purchase girl clothing if available

  Scenario: Scenario 2: Girl's size input within range 20-25
    Given the customer inputs a girl's size 24
    When the system checks for available boy clothing sizes
    Then the system recommends boy clothing sizes within the range of 20 to 30
    And provides an option to purchase boy clothing if available

  Scenario: Scenario 3: Matching sizes available
    Given the customer inputs a boy's size of 25
    When the system finds that girl clothing size 25 is available
    Then the system enables an option to purchase girl clothing for the boy

  Scenario: Scenario 4: No matching sizes found
    Given the customer inputs a boy's size 15
    When the system checks for available girl clothing sizes
    Then the system does not recommend any clothing
    And no purchasing options are offered

  Scenario: Scenario 5: Boy's size input with no available clothing
    Given the customer inputs a boy's size 30
    When the system checks for available girl clothing sizes
    Then the system does not recommend any clothing
    And no purchasing options are offered

  Scenario Outline: Scenario Outline: Validate Clothing Size Recommendations
    Given the customer inputs a clothing size of <size>
    And the system has clothing sizes available
    When the system processes the size input
    Then the system should recommend valid sizes based on the input
    Examples:
      | size | expected_recommendation |
      | 22 | Recommend girl sizes 20-25 |
      | 24 | Recommend boy sizes 20-30 |
      | 25 | Enable purchase of girl clothing |
      | 15 | No recommendations available |

