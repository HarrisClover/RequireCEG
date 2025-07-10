Feature: Integration with AWS services
  As a user,
  I want to be able to interact with AWS services
  So that I can effectively manage and retrieve cloud resources

Scenario Outline: Retrieve resources from AWS services
  Given that the user is authenticated and has the necessary permissions
  When the user issues an API call to <aws-service> to list available resources
  Then the system should return a list of resources from <aws-service>
  And the response should be in the correct format for <aws-service>
  And the system should handle error scenarios gracefully
  And the system should return informative error codes and messages when invalid inputs are provided
  
  Examples:
    | aws-service           |
    | Amazon SNS            |
    | Amazon WorkSpaces     |
    | Amazon SQS            |
    | Amazon SES            |
    | AWS Storage Gateway   |
    | AWS IAM               |
    | Amazon RDS            |
    | API Gateway           |

Scenario: Handling non-existent resources
  Given that the user has the necessary permissions
  When the user tries to get a non-existent resource from <aws-service>
  Then the system should return an appropriate error code
  And the system should provide a clear error message indicating the resource does not exist

Scenario: Invalid parameter handling
  Given that the user is interacting with <aws-service>
  When the user provides invalid parameters for an operation
  Then the system should return an error code indicating invalid parameters
  And the system should provide an informative error message

Scenario: Incorrect identifier handling
  Given that the user is interacting with <aws-service>
  When the user provides an incorrect identifier
  Then the system should return an error code indicating the identifier is incorrect
  And the system should provide a clear error message
