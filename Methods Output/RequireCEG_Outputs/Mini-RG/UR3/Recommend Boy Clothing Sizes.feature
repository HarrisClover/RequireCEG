Feature: Recommend Boy Clothing Sizes

  As a customer searching for clothing sizes
  I want the system to recommend available boy clothing sizes based on my request
  So that I can find appropriate clothing to purchase

  Background:
    Given the inventory contains various clothing sizes for boys and girls
    And the customer provides a clothing size request

  Scenario: Scenario 1: Recommend sizes for boys
    Given a boy requests a clothing size of 25
    When the system checks the available boy sizes
    Then the system retrieves and recommends boy sizes 22, 24, and 26
    And the customer can proceed with the purchase of recommended sizes

  Scenario: Scenario 2: Recommend sizes for girls
    Given a girl requests a clothing size of 23
    When the system checks the available girl sizes
    Then the system retrieves and recommends girl sizes 20, 21, and 24
    And the customer can proceed with the purchase of recommended sizes

  Scenario: Scenario 3: Substitute clothing option
    Given a girl requests a clothing size of 24 but only boy sizes 22 and 26 are available
    When the system checks for substitutions
    Then the system provides an option to buy boy's clothing (size 22) as a substitute for the girl's clothing

  Scenario: Scenario 4: No suitable sizes found for boys
    Given a boy requests a clothing size of 18
    When the system checks the available sizes
    Then the system restricts the purchase
    And the system informs that no suitable sizes were found

  Scenario: Scenario 5: No suitable sizes found for girls
    Given a girl requests a clothing size of 26
    When the system checks the available sizes
    Then the system restricts the purchase
    And the system informs that no suitable sizes were found

  Scenario Outline: Scenario Outline: Size recommendation based on user input
    Given a customer requests a clothing size <size>
    And the inventory has boy sizes <boy-sizes> and girl sizes <girl-sizes>
    When the system checks for the requested size
    Then the system recommends available sizes <available-sizes>
    Examples:
      | size | boy-sizes | girl-sizes | available-sizes |
      | 22 | [20, 21, 22, 23, 24] | [20, 21] | [20, 21, 22] |
      | 25 | [25, 26, 27] | [22, 23, 24] | [25, 26] |
      | 30 | [30, 31, 32] | [29, 30] | [30, 31] |

