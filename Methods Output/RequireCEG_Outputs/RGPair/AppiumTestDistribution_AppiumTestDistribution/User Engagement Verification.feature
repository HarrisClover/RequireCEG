Feature: User Engagement Verification

  As a user of the system
  I want to log in and interact with the number interface
  So that I can engage with specific combinations and receive appropriate feedback

  Background:
    Given the user is prompted to log in if not authenticated
    And the user has successfully logged in

  Scenario: User clicks on numbers 4 and 3
    Given the user is logged into the system
    When the user clicks on numbers 4 and 3
    Then the system should display 'Combination A engaged'

  Scenario: User clicks on numbers 1 and 2
    Given the user is logged into the system
    When the user clicks on numbers 1 and 2
    Then the system should display 'Combination B engaged'

  Scenario: User clicks on numbers 1 and 3
    Given the user is logged into the system
    When the user clicks on numbers 1 and 3
    Then the system should display 'Combination C engaged'

  Scenario: User clicks on number 3 while predefined flag is set
    Given the user is logged into the system
    And the predefined flag is set
    When the user clicks on number 3
    Then the system should display 'Combination D engaged'

  Scenario: User clicks number 3 after engaging Combination D
    Given the user is logged into the system
    And the predefined flag is set
    When the user clicks on number 3 after previously clicking 1 and 2
    Then the system should confirm that the input is valid

  Scenario Outline: User clicks distinct combinations based on flag
    Given the user is logged into the system
    And the predefined flag is <flag-set>
    When the user clicks on numbers <first-number> and <second-number>
    Then the system should display <expected-outcome>
    Examples:
      | flag-set | first-number | second-number | expected-outcome |
      | true | 1 | 2 | Combination D engaged |
      | true | 1 | 3 | Combination C engaged |
      | false | 1 | 2 | Combination B engaged |
      | false | 4 | 3 | Combination A engaged |

