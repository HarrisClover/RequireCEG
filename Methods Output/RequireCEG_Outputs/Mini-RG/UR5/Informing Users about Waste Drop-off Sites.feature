Feature: Informing Users about Waste Drop-off Sites

  As a user
  I want to be informed about the availability of special waste drop-off sites
  So that I can make decisions about waste disposal options

  Background:
    Given the user is located in a specific area
    And the system is checking for nearby waste drop-off sites

  Scenario: Scenario 1: No drop-off sites available
    Given the system has determined the user's location
    When the system checks for special waste drop-off sites
    Then the user should receive a message
    And the message should state 'There are no special waste drop-off sites available near you.'

  Scenario: Scenario 2: Check condition for action
    Given the system has determined that there are no special waste drop-off sites available in the user's vicinity
    When the user is informed about site availability
    Then the system must print the message 'There are no special waste drop-off sites available near you.'
