Feature: Create REST Mock Services with SEQUENCE Responses

  As a user managing REST mock services
  I want to create a sequence of responses with specific transition rules
  So that I can effectively simulate and test the behavior of my mock services

  Background:
    Given the user has initiated the creation of a REST mock service
    And the user has specified the response type as 'SEQUENCE'

  Scenario: Adding a valid success response to the sequence
    Given the user has created an initial success response with HTTP 200 status
    When the user adds another success response to the sequence
    Then the sequence should reflect both success responses
    And the user can add a redirect response with a status code between 300 and 399

  Scenario: Attempting to add an error response after a success response
    Given the user has a success response with HTTP 200 status
    When the user tries to add an error response with a status code between 400 and 599
    Then the system produces a warning message advising caution for transitions from success to error responses

  Scenario: Rearranging the sequence of responses
    Given the user has a predefined sequence of responses
    When the user rearranges the response order
    Then the request view should immediately reflect the rearranged sequence of responses

  Scenario: Removing a response from the sequence
    Given the user has a sequence with multiple responses
    When the user removes one response from the sequence
    Then the subsequent responses should automatically adjust their positions, maintaining a continuous sequence without gaps

  Scenario: Saving the SEQUENCE responses
    Given the user has defined multiple SEQUENCE responses
    When the user opts to save the defined responses
    Then the system should synchronize all stored responses with the designated parameter settings

  Scenario: Tracking applied parameters within SEQUENCE responses
    Given the user has defined multiple SEQUENCE responses with specified parameters
    When the user opts to save the defined responses
    Then the parameters applied within the SEQUENCE response are automatically logged for tracking and auditing
