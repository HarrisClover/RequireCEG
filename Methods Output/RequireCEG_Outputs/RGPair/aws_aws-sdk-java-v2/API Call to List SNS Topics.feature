Feature: API Call to List SNS Topics

  As an AWS user
  I want to list SNS topics available in my AWS account
  So that I can manage and interact with my SNS topics efficiently

  Background:
    Given the user is logged into their AWS account
    And the user has the proper permissions to list SNS topics

  Scenario: Successful Listing of SNS Topics
    Given the user has topics available in their account
    When the user sends an API call to list SNS topics
    Then the response should include the list of SNS topics
    And the response should contain the ARNs and names of the topics

  Scenario: User Lacks Permissions
    Given the user is authenticated but lacks permissions
    When the user sends an API call to list SNS topics
    Then the response should return a 403 Forbidden error
    And the message should state 'Access Denied: You do not have permission to list SNS topics.'

  Scenario: User Not Authenticated
    Given the user is not connected to their AWS account
    When the user sends an API call to list SNS topics
    Then the response should return a 401 Unauthorized error
    And the message should state 'Unauthorized: You must be authenticated to access this resource.'

  Scenario: Invalid Parameters
    Given the user sends invalid parameters in the request
    When the request is processed
    Then the response should return a 400 Bad Request error
    And the message should state 'Invalid input provided: Please check the parameters and try again.'

  Scenario: No Available SNS Topics
    Given the user has no SNS topics in their account
    When the user sends an API call to list SNS topics
    Then the response should indicate that no topics are available
    And the message should suggest creating topics or check for existing topics.

  Scenario: User Authenticated and Valid Parameters
    Given the user is logged in and has provided valid parameters
    When the user sends an API call to list SNS topics
    Then the system processes the request and returns a list of SNS topics with ARNs and names.
