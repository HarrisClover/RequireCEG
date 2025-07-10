Feature: Consistent Response Format for SQS

  As a user of the SQS API
  I want to retrieve a list of available SQS queues in a consistent format
  So that I can effectively manage and visualize the queues

  Background:
    Given the user is authenticated and authorized to access the SQS service
    And the user has specified valid parameters for the request

  Scenario: Valid API call to list queues with existing queues
    Given the user issues an API call to list available SQS queues
    When the request parameters are valid and the queues exist
    Then the system responds with a structured JSON object containing queue details
    And the response includes QueueName, QueueUrl, and CreationTimestamp

  Scenario: Invalid API call to list queues with special characters
    Given the user issues an API call with request parameter QueueName containing special characters
    When the system validates the parameters
    Then the system responds with a '400 Bad Request' error
    And the error message indicates that special characters are not allowed

  Scenario: API call for a non-existent queue
    Given the user issues an API call to list a specific SQS queue
    When the specified queue does not exist
    Then the system responds with a '404 Not Found' error
    And the message indicates that the specified queue does not exist

  Scenario: Empty SQS queues response when no queues are available
    Given the user is authenticated and there are no SQS queues available
    When the user issues an API call to list queues
    Then the system responds with an empty JSON array
    And the response status is '200 OK'

  Scenario: Response when no queues are available with no content
    Given the user is authenticated and there are no SQS queues available
    When the user issues an API call to list queues
    Then the system responds with an empty JSON array
    And the response status is '204 No Content'
