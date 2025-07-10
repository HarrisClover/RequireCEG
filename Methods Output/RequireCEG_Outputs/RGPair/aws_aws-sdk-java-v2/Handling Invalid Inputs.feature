Feature: Handling Invalid Inputs

  As a user of AWS services
  I want to receive clear feedback when I make invalid API calls
  So that I can correct my requests and use the services effectively

  Background:
    Given the system is connected to various AWS services
    And the user has valid access permissions

  Scenario: Scenario 1: Listing resources from Amazon SNS
    Given a user attempts to list SNS topics
    And the specified topic does not exist
    When the user sends a request to list the topic
    Then the response should have an error code 404
    And the message should be 'Topic not found'

  Scenario: Scenario 2: Listing queues in Amazon SQS
    Given a user attempts to list SQS queues
    When the user uses a non-existent queue name
    Then the response should have an error code 400
    And the message should be 'Invalid queue name'

  Scenario: Scenario 3: Retrieving a workspace from Amazon WorkSpaces
    Given a user attempts to retrieve a workspace
    When the workspace does not exist
    Then the response should have an error code 404
    And the message should be 'Workspace not found'

  Scenario: Scenario 4: Fetching email identities in Amazon SES
    Given a user attempts to fetch email identities
    When an invalid identifier is provided
    Then the response should have an error code 400
    And the message should be 'Invalid email identity'

  Scenario: Scenario 5: Validating AWS Storage Gateway requests
    Given a user makes a request to the AWS Storage Gateway
    When an incorrect gateway ID is included
    Then the response should have an error code 400
    And the message should be 'Gateway ID is invalid'

  Scenario: Scenario 6: AWS IAM operations with invalid parameters
    Given a user attempts to perform an IAM operation
    When incorrect parameters are included
    Then the response should have an error code 400
    And the message should detail the nature of the invalid parameters

  Scenario: Scenario 7: Handling all conditions not occurring for SNS topics, SQS queues, and WorkSpaces workspaces, email identities, and AWS Storage Gateway IDs and IAM parameters in bulk requests without any errors or valid data returning valid responses at once. If none of these conditions are satisfied, no resources should be referenced in the response. The response must be clear about the lack of results without indicating specific error messages.
    Given a user attempts to list multiple AWS services
    When the user checks for existing resources but none exist
    Then the response should indicate empty results without any error

  Scenario Outline: Scenario Outline: General Error Handling
    Given a user attempts to interact with an AWS service with <invalid-input>
    When the request is sent
    Then the response should return error code <error-code>
    And the message should be '<error-message>'
    Examples:
      | invalid-input | error-code | error-message |
      | non-existent SNS topic | 404 | Topic not found |
      | non-existent SQS queue | 400 | Invalid queue name |
      | non-existent workspace | 404 | Workspace not found |
      | invalid SES email identifier | 400 | Invalid email identity |
      | incorrect gateway ID | 400 | Gateway ID is invalid |
      | incorrect IAM parameters | 400 | Invalid parameters provided |

