Feature: REST Mock Services Management

  As a software developer
  I want to create, edit, and manage both REST and SOAP mock services
  So that I can test my applications efficiently with mock responses

  Background:
    Given the application supports REST Mock services
    And users can dispatch mock responses based on SEQUENCE or SCRIPT

  Scenario: Scenario 1: Create a REST Mock Service
    Given a user is logged into the system
    When the user creates a new REST mock service with valid parameters
    Then the service should be listed in the mock services directory
    And the user should be able to edit the service details

  Scenario: Scenario 1: Handle Invalid Input During REST Mock Service Creation
    Given a user is logged into the system
    When the user attempts to create a new REST mock service with invalid parameters
    Then an error message should be displayed indicating invalid input

  Scenario: Scenario 2: Manage OAuth 2.0 Profiles
    Given a user has created valid OAuth 2.0 profiles
    When the user applies a token in a request
    Then the request should include the access token

  Scenario: Scenario 2.1: Create OAuth 2.0 Profile
    Given the user is logged into the system
    When the user creates a new OAuth 2.0 profile with valid details
    Then the profile should be saved and listed under OAuth 2.0 profiles

  Scenario: Scenario Outline: Handle Mock Responses
    Given the user has defined mock responses for request type <request-type>
    When the user sends a request to the mock service
    Then the service should respond with the desired mock response
    And the user has provided valid parameters for sequence <sequence> and script <script>
    Examples:


  Scenario: Scenario 3: Output Validation of Mock Responses
    Given the user has defined valid mock responses for request type REST
    When the user sends a request that matches the defined parameters
    Then the service should validate the mock response and return the correct output

  Scenario: Scenario 4: Delete a Mock Service
    Given a user is logged into the system
    When the user decides to delete the mock service
    Then the mock service should be removed from the directory
    And the user has a mock service listed in the directory
