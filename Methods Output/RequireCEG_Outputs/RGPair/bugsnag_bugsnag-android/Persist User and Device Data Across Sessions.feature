Feature: Persist User and Device Data Across Sessions

  As a developer
  I want to capture and persist relevant user and device data during crashes and errors
  So that I can maintain continuity in error tracking and enhance the application's stability

  Background:
    Given the application has user identifier, device model, and operating system version
    And the application can initialize and retrieve session data from persistent storage

  Scenario: Handling a Native Crash
    Given the application encounters an unhandled exception
    And the user is logged into the application
    When the crash occurs
    Then the system should capture user identifier, device model, and OS version
    And this data should be logged without generating duplicates

  Scenario: Resuming a Session After an Error
    Given the application was previously reported to have crashed
    When the user starts a new session
    Then the application should retrieve existing user data from persistent storage

  Scenario: Capturing ANR Events
    Given the application encounters an Application Not Responding (ANR) event with user identifier <user-id>
    And the device model is <device-model>
    When the session is interrupted and then resumed
    Then the system should retain the state of user and device information

  Scenario: Customizing Metadata
    Given the user opts to customize the metadata through the plugin interface
    When the customization is submitted
    Then the application should store the customized information
    And link it with the relevant session data

  Scenario: Logging Handled Errors
    Given the application captures a handled error event
    And user and device information is logged in the error report
    Then the user should be notified about the logged handled error

  Scenario: Persisting User and Device Data on Crash
    Given the application captures user identifier, device model, and operating system version
    When the application encounters a crash or exception
    Then the relevant user and device data is persisted upon crash or exception

  Scenario: Generating Unique Error Reports
    Given the application generates error reports
    When the application processes error reporting
    Then the error report should be generated without duplicates

  Scenario: Storing Customized Metadata Successfully
    Given the user opts to customize the metadata through the plugin interface
    When the customization is submitted
    Then the customized metadata should be linked with relevant session data successfully
