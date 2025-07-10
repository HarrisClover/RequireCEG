Feature: Define Size Range for Girls (20 to 25)

  As a store owner
  I want to validate sizes for girl clothes
  So that customers can only purchase available sizes

  Background:
    Given the size range for girls is set between 20 and 25
    And the size range for boys is set between 20 and 30

  Scenario: Scenario 1: Valid girl size input
    Given a user inputs a girl size of 22
    When the system checks for available girl clothes
    Then the system should allow the user to view available girl clothes

  Scenario: Scenario 2: Invalid girl size input - too small
    Given a user inputs a girl size of 18
    When the system validates the size
    Then the system should display 'Invalid size. Please input a size between 20 and 25.'

  Scenario: Scenario 3: Invalid girl size input - too large
    Given a user inputs a girl size of 26
    When the system validates the size
    Then the system should display 'Invalid size. Please input a size between 20 and 25.'

  Scenario: Scenario 4: Boy size and girl size match
    Given a user inputs a boy size of 22
    And a user inputs a girl size of 22
    When the system checks for available girl clothes
    Then the system should allow the user to purchase the corresponding girl clothes for the boy

  Scenario: Scenario 5: Girl size exceeds available boy size
    Given a user inputs a girl size of 31
    When the system checks for available sizes
    Then the system should display 'Cannot proceed with the purchase, size exceeds available stock for boys.'

  Scenario: Scenario 6: No suitable sizes available
    Given no suitable sizes are available for purchase for either boys or girls
    When the user tries to check for sizes
    Then the system should display 'No suitable sizes available for purchase.'

  Scenario: Scenario 7: Invalid girl size input when no sizes are available
    Given a user inputs a girl size of 22
    And there are no suitable sizes available for purchase
    When the system checks for available girl clothes
    Then the system should display 'No suitable sizes available for purchase.'
