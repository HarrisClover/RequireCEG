Feature: Allow Free Access to API

  As a user
  I want to access the API without an access key or with a valid access key
  So that I can utilize the API features without unnecessary barriers

  Background:
    Given the API exists
    And the API can either require or not require an access key

  Scenario: Scenario 1: Access Free API
    Given the API is categorized as free
    When a user attempts to access the API without an access key
    Then access should be granted
    And the message 'Access to the API is granted without any further checks.' should be displayed

  Scenario: Scenario 2: Valid Access Key
    Given the user possesses a valid access key
    When the user attempts to access the API
    Then access should be granted
    And the message 'Access to the API is granted.' should be displayed

  Scenario: Scenario 3: Expired Access Key
    Given the user possesses an access key that has expired
    When the user attempts to access the API
    Then an error message stating 'Your access key has expired.' should be displayed

  Scenario: Scenario 4: Invalid Access Key
    Given the user possesses an access key that does not match any records
    When the user attempts to access the API
    Then an error message indicating 'Invalid credentials.' should be displayed

  Scenario: Scenario 5: Insufficient Permissions
    Given the user possesses a valid access key with insufficient permissions
    When the user attempts to access a restricted API feature
    Then a message indicating 'Insufficient permissions to access this API.' should be displayed

  Scenario: Scenario 6: Access Key Validation Logic
    Given the user possesses an access key that is presented as valid
    When the user attempts to access the API with the provided access key
    Then the system must validate the access key and check whether it is within its active period
    And if the key is not in its active period, the message 'Your access key has expired.' should be displayed

  Scenario: Scenario 7: Access Key Permissions Logic
    Given the user possesses an access key that exists in the records but lacks appropriate permissions
    When the user attempts to access a feature of the API
    Then an error message indicating 'Insufficient permissions to access this API.' should be displayed
