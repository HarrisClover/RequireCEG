Feature: AWS Services Integration
  As a system user,
  I want to interact with AWS services and retrieve the relevant resources or error information,
  So that I can manage cloud resources effectively.

Scenario Outline: List resources in a specific AWS service
  Given that the system integrates with <service-name> AWS service
  And the user has valid credentials
  When the user requests to list <resource-type> in <service-name>
  Then the system should return a list of <resource-type> for the <service-name>
  And the response format should be consistent with <service-name>'s API specification

  Examples:
    | service-name  | resource-type |
    | Amazon SNS    | topics        |
    | Amazon SQS    | queues        |
    | Amazon SES    | email identities |
    | AWS WorkSpaces| workspaces    |

Scenario Outline: Handle invalid requests to AWS services
  Given that the system integrates with <service-name> AWS service
  And the user has valid credentials
  When the user requests to list <resource-type> in <service-name> with invalid parameters
  Then the system should return an error with code <error-code> and message <error-message>

  Examples:
    | service-name   | resource-type | error-code    | error-message                             |
    | Amazon SNS     | topics        | InvalidInput  | Invalid input for listing SNS topics      |
    | Amazon SQS     | queues        | NotFound      | Queue not found                           |
    | Amazon SES     | email identities | NotFound  | Email identity not found                  |
    | AWS WorkSpaces | workspaces    | InvalidParam  | Invalid workspace parameter provided      |

Scenario Outline: Handle non-existent resources in AWS services
  Given that the system integrates with <service-name> AWS service
  And the user has valid credentials
  When the user attempts to retrieve a non-existent <resource-type> in <service-name>
  Then the system should return an error with code <error-code> and message <error-message>

  Examples:
    | service-name  | resource-type | error-code  | error-message                        |
    | Amazon SNS    | topic         | NotFound    | Topic does not exist                 |
    | Amazon SQS    | queue         | NotFound    | Queue does not exist                 |
    | Amazon SES    | email identity| NotFound    | Email identity does not exist        |
    | Amazon RDS    | database      | NotFound    | Database instance not found          |

Scenario Outline: Ensure consistent response format for AWS services
  Given that the system integrates with <service-name> AWS service
  When the user requests to list <resource-type> in <service-name>
  Then the response should have a status of 200 OK
  And the response should follow the <service-name> API response structure

  Examples:
    | service-name  | resource-type |
    | Amazon SNS    | topics        |
    | Amazon SQS    | queues        |
    | Amazon SES    | email identities |
    | API Gateway   | endpoints     |

