Feature: Manage Existing Wrappers and Notify Users

  As a user
  I want to create, manage, and delete wrappers effectively
  So that I can streamline my workflow without any interruptions

  Background:
    Given a user is logged into the system
    And there is a current wrapper in the system

  Scenario: Scenario 1: Attempt to create a new wrapper when one already exists
    Given a wrapper is currently active
    When the user attempts to create a new wrapper
    Then the message 'A wrapper already exists. Please manage the existing wrapper instead.' should be displayed

  Scenario: Scenario 2: Manage an existing wrapper
    Given the user wants to manage the existing wrapper
    When the user attempts to access the current wrapper
    Then the system should present the details of the current wrapper

  Scenario: Scenario 3: Attempt to delete a non-existing wrapper
    Given there is no active wrapper
    When the user tries to delete a wrapper
    Then the error message 'The specified wrapper was not found.' should be returned

  Scenario: Scenario 4: Manage an existing wrapper successfully
    Given the user wants to manage the current wrapper
    When the user performs the management action
    Then the message 'Wrapper management successful.' should be confirmed

  Scenario: Scenario 5: Permission denied when creating or managing a wrapper
    Given the user does not have the necessary permissions
    When the user attempts to create or manage a wrapper
    Then the notification 'Permission denied. Unable to access or modify the wrapper.' should be displayed

  Scenario: Scenario 6: Incorrect directory structure
    Given the user specifies a directory structure
    When the system checks the directory format
    Then the message 'The directory structure is incorrect. Please ensure it meets the required format.' should be shown

  Scenario: Scenario 7: Manage existing wrapper fails due to insufficient permissions
    Given a wrapper is currently active
    And the user does not have permission to manage the wrapper
    When the user attempts to manage the existing wrapper
    Then the notification 'Permission denied. Unable to access or modify the wrapper.' should be displayed

  Scenario: Scenario 8: Directory structure is incorrect
    Given the user specifies an incorrect directory structure
    When the system checks the directory format
    Then the message 'The directory structure is incorrect. Please ensure it meets the required format.' should be shown
