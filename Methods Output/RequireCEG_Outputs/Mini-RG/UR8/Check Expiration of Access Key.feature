Feature: Check Expiration of Access Key

  As a user attempting to access the API
  I want to validate my access key
  So that I can gain appropriate access to features without facing issues

  Background:
    Given the user has an access key
    And the user is trying to access the API

  Scenario: Valid Access Key and Not Expired
    Given the access key is valid
    And the access key is not expired
    When the user requests access to the API
    Then the user should gain access to the API

  Scenario: Access Key is Invalid
    Given the access key is invalid
    When the user attempts to access the API
    Then the system should display 'The access key is incorrect.'

  Scenario: Access Key has Expired
    Given the access key is valid
    And the access key has expired
    When the user attempts to access the API
    Then the system should display 'The access key has expired and access is denied.'

  Scenario: Insufficient Permissions with Valid Key
    Given the access key is valid
    And the access key is not expired
    When the user attempts to access a restricted API feature
    Then the system should display 'Insufficient permissions to access the API.'

  Scenario: Access Key Provided
    Given the access key is provided
    When the user checks the validity
    Then the system must validate the access key

  Scenario: Access Key Not Provided
    Given the access key is not provided
    When the user attempts to access the API
    Then the system should block access and display 'Access key is required.'

  Scenario: Restrictions on Access Key Usage
    Given the access key is valid
    And the access key has not expired
    When the associated permissions are inadequate
    Then the system should display 'Insufficient permissions to access the API.'
