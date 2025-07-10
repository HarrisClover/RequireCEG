Feature: Determine Eligibility for Cross-Purchase (Girl Clothes for Boy)

  As a store owner
  I want to ensure that customers can only purchase girl clothes for boys if the sizes are appropriate
  So that I can prevent inappropriate purchases and maintain customer satisfaction

  Background:
    Given the size range for girl clothes is between 20 and 25
    And the size range for boy clothes is between 20 and 30

  Scenario: Valid purchase of girl clothes for a boy
    Given a boy with size 25
    And girl clothes with size 20
    When the customer attempts to purchase the girl clothes
    Then the purchase is permitted
    And the system confirms the purchase

  Scenario: Invalid purchase of girl clothes for a boy - size too large
    Given a boy with size 25
    And girl clothes with size 26
    When the customer attempts to purchase the girl clothes
    Then the purchase is not allowed
    And the system displays 'The girl clothes do not fit the boy, purchase not allowed.'

  Scenario: Invalid purchase when boy clothes size is greater than girl clothes size
    Given a boy with size 28
    And girl clothes with size 25
    When the customer attempts to purchase the girl clothes
    Then the purchase is not allowed,
    And the system displays 'Purchase not allowed for either option.'

  Scenario: Invalid purchase of girl clothes for a boy - size too small
    Given a boy with size 20
    And girl clothes with size 18
    When the customer attempts to purchase the girl clothes
    Then the purchase is not allowed
    And the system displays 'The girl clothes do not fit the boy, purchase not allowed.'

  Scenario Outline: Scenario Outline: Purchase Eligibility Check
    Given the size of boy clothes is <boy-size>
    And the size of girl clothes is <girl-size>
    When the customer attempts to purchase girl clothes for the boy
    Then the system checks size compatibility
    And the outcome should be <outcome>
    Examples:
      | boy-size | girl-size | outcome |
      | 25 | 20 | allowed |
      | 30 | 25 | allowed |
      | 25 | 26 | not allowed |
      | 22 | 24 | allowed |
      | 28 | 27 | not allowed |
      | 28 | 25 | not allowed |

