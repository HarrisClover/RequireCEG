Feature: Decision Logic for Buying Girl Clothes

  As a user looking to purchase clothes
  I want the system to determine the availability of sizes for both boy and girl clothes
  So that I can make an informed decision on my purchase options

  Background:
    Given the user is interested in purchasing clothes for a boy or a girl
    And the system holds information about available sizes for both categories

  Scenario: Scenario 1: Buy clothes for a boy with available sizes
    Given the user is searching for boy clothes
    When the system checks for available sizes between 20 and 30
    Then if suitable sizes are found, the user is allowed to proceed with the purchase
    And the system displays the available sizes

  Scenario: Scenario 2: No available sizes for boy clothes
    Given the user is searching for boy clothes
    When the system checks for available sizes between 20 and 30
    Then if no suitable sizes are found, the system indicates that no boy clothes can be purchased
    And the system displays E5

  Scenario: Scenario 3: Buy clothes for a girl with available sizes
    Given the user is searching for girl clothes
    When the system checks for available sizes between 20 and 25
    Then if appropriate sizes are available, the user is allowed to proceed with the purchase
    And the system displays the available sizes

  Scenario: Scenario 4: No available sizes for girl clothes
    Given the user is searching for girl clothes
    When the system checks for available sizes between 20 and 25
    Then if no suitable sizes are found, the system indicates that no girl clothes can be purchased
    And the system displays E6

  Scenario: Scenario 5: Overlapping sizes for boy and girl clothes
    Given suitable sizes for boy clothes are available
    And suitable sizes for girl clothes are also available
    When the system checks the overlap of sizes
    Then the user is presented the option to purchase girl clothes for the boy
    And the user is offered the opportunity to buy boy clothes for the girl
    And the system displays E3 and E4

  Scenario: Scenario 6: No compatible sizes for either option
    Given there are no suitable sizes for boy and girl clothes
    When the user attempts to purchase
    Then the system notifies the user that no clothes can be purchased
    And the system displays E7

  Scenario: Scenario 7: Available sizes but no suitable selection for boy clothes
    Given the user is searching for boy clothes
    And there are available sizes for girl clothes ranging from 20 to 25
    When the system checks for available sizes for boy clothes
    Then if there are no suitable sizes for boy clothes, the system indicates that no boy clothes can be purchased
    And the system displays E5

  Scenario: Scenario 8: Available sizes but no suitable selection for girl clothes
    Given the user is searching for girl clothes
    And there are available sizes for boy clothes ranging from 20 to 30
    When the system checks for available sizes for girl clothes
    Then if there are no suitable sizes for girl clothes, the system indicates that no girl clothes can be purchased
    And the system displays E6
