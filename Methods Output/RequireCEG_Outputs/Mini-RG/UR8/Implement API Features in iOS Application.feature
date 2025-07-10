Feature: Implement API Features in iOS Application

  As a user of the application
  I want to access the API with my access key
  So that I can utilize the features provided by the API

  Background:
    Given the API access policy is defined
    And a user intends to access the API

  Scenario: Scenario 1: Free API Access
    Given the API access is free
    When the user attempts to access the API
    Then access should be granted without requiring an access key

  Scenario: Scenario 2: Valid Access Key
    Given the user provides a valid access key
    And the access key has not expired
    When the user attempts to access the API
    Then access should be granted to the API

  Scenario: Scenario 3: Expired Access Key
    Given the user provides an expired access key
    When the user attempts to access the API
    Then an error message stating 'Your access key has expired' should be displayed

  Scenario: Scenario 4: Invalid Access Key
    Given the user provides an invalid access key
    When the user attempts to access the API
    Then an error message stating 'Your access key is invalid' should be displayed

  Scenario: Scenario 5: Insufficient Permissions
    Given the user provides a valid access key
    And the access key is valid but lacks necessary permissions
    When the user attempts to access a specific API feature
    Then an error message stating 'Insufficient permissions for this action' should be returned

  Scenario: Scenario 6: Invalid Access Key and Expired Access Key
    Given the user provides an invalid access key
    And the user provides an expired access key
    When the user attempts to access the API
    Then an error message stating 'Your access key is invalid' should be displayed

  Scenario: Scenario 7: Lacking Necessary Permissions
    Given the user provides a valid access key
    And the access key is valid
    And the access key lacks necessary permissions for specific API features
    When the user attempts to access the API feature
    Then an error message stating 'Insufficient permissions for this action' should be returned
