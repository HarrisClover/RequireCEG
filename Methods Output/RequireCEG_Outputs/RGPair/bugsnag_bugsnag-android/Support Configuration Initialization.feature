Feature: Support Configuration Initialization

  As a user of the application
  I want the system to initialize the Bugsnag notifier with the correct API key
  So that I can ensure accurate error reporting

  Background:
    Given the application is launched for the first time
    And the user has provided the necessary configuration data

  Scenario: Scenario 1: API Key Present
    Given the user has provided the Bugsnag API key
    When the system initializes the Bugsnag notifier
    Then the initial session is captured
    And necessary session data is stored

  Scenario: Scenario 2: API Key Change
    Given the user has changed the API key in application settings
    When the system re-initializes the Bugsnag notifier
    Then subsequent error reports are connected to the new API key

  Scenario: Scenario 3: No Configuration Data
    Given the user has not provided the necessary configuration data
    When the application is launched
    Then the user is prompted to enter the required fields

  Scenario: Scenario 4: Persisting Existing Session Data
    Given there is existing session data available
    And the user has provided the Bugsnag API key
    When the system checks for user and device metadata
    Then the metadata should be persisted in the error reporting payload

  Scenario: Scenario 5: Incomplete Configuration Prompts User
    Given the user has not provided the Bugsnag API key at the initial launch
    When the application starts
    Then the system prompts the user to enter the required fields before permitting error reporting
