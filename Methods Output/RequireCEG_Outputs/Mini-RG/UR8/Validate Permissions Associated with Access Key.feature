Feature: Validate Permissions Associated with Access Key

  As a developer
  I want to ensure that the access key checks against valid, expired, and permission-based scenarios
  So that I can control who accesses the API and maintain security

  Background:
    Given an access key in use
    And the API endpoint is secured

  Scenario: Scenario 1: Free Access Key
    Given the access key is free
    When a request is made to access the API
    Then access to the API should be granted
    And the relevant data is returned

  Scenario: Scenario 2: Valid Non-Expired Access Key with Permissions
    Given a valid access key that has not expired
    And the permissions associated with the access key allow access to the requested API endpoint
    When a request is made to access the API
    Then access to the API should be granted
    And the relevant data is returned

  Scenario: Scenario 3: Valid Non-Expired Access Key without Permissions
    Given a valid access key that has not expired
    And the access key does not have permissions for the requested API endpoint
    When a request is made to access the API
    Then access to the API should be denied
    And the message 'Insufficient permissions to access this API endpoint.' is displayed

  Scenario: Scenario 4: Incorrect Access Key
    Given an incorrect access key is provided
    When a request is made to access the API
    Then access to the API should be denied
    And the message 'The access key provided is incorrect.' is displayed

  Scenario: Scenario 5: Expired Access Key
    Given an access key that has expired
    When a request is made to access the API
    Then access to the API should be denied
    And the message 'The access key has expired. Access is denied.' is displayed

  Scenario: Scenario 6: Valid Access Key Failing on Permissions
    Given a valid access key that has not expired
    And the permissions associated with the access key do not allow access to the requested API endpoint
    When a request is made to access the API
    Then access to the API should be denied
    And the message 'Insufficient permissions to access this API endpoint.' is displayed

  Scenario: Scenario 7: Valid Access Key with Expired Condition
    Given a valid access key that is expected to be valid but is considered expired
    When a request is made to access the API
    Then access to the API should be denied
    And the message 'The access key has expired. Access is denied.' is displayed
