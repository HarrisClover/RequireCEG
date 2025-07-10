Feature: AWS Service Integration and Error Handling
As a cloud administrator,
I want the system to support integration with various AWS services,
So that I can effectively manage and retrieve cloud resources while receiving consistent feedback on errors.

Scenario: List SNS Topics
Given I have valid AWS credentials
When I issue an API call to list available SNS topics
Then the response should include a list of SNS topics
And the response format should conform to SNS specifications

Scenario: List Amazon WorkSpaces
Given I have valid AWS credentials
When I issue an API call to list available WorkSpaces
Then the response should include a list of workspaces
And the response format should conform to WorkSpaces specifications

Scenario: List SQS Queues
Given I have valid AWS credentials
When I issue an API call to list available SQS queues
Then the response should include a list of queues
And the response format should conform to SQS specifications

Scenario: List SES Email Identities
Given I have valid AWS credentials
When I issue an API call to list available SES email identities
Then the response should include a list of email identities
And the response format should conform to SES specifications

Scenario: List AWS Storage Gateway Resources
Given I have valid AWS credentials
When I issue an API call to list available Storage Gateway resources
Then the response should include a list of storage gateways
And the response format should conform to AWS Storage Gateway specifications

Scenario: Requesting a Non-Existent Resource
Given I have valid AWS credentials
When I attempt to retrieve a resource that does not exist (e.g., a non-existent SQS queue URL)
Then the API should return an error response
And the error response should include an informative error code and message

Scenario: AWS IAM Operation with Invalid Parameter
Given I have valid AWS credentials
When I perform an AWS IAM operation using an invalid parameter
Then the API should return an error response
And the error message should clearly indicate that an invalid parameter was provided

Scenario: Amazon RDS Operation with an Invalid Identifier
Given I have valid AWS credentials
When I attempt an Amazon RDS operation using an invalid identifier
Then the API should return an error response
And the error message should clearly indicate that the identifier does not exist

Scenario: API Gateway Call with Incorrect Parameters
Given I have valid AWS credentials
When I perform an API Gateway call using incorrect parameters
Then the API should return an error response
And the error message should specify the nature of the parameter error

Scenario: General Error Handling for AWS Service Calls
Given I have valid AWS credentials
When I issue an API call with invalid input to any AWS service
Then the system should return an error response with an appropriate error code and message
And the error response format should be consistent with the specifications of the respective AWS service