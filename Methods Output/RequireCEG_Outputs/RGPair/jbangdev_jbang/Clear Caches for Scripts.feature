Feature: Clear Caches for Scripts

  As a system administrator
  I want to ensure that cache clearing only occurs when no scripts are active
  So that I can avoid any potential disruptions to running processes

  Background:
    Given a user accesses the cache clearance command
    And the system checks for currently loaded scripts

  Scenario: Scenario 1: Clear cache with loaded scripts
    Given there are currently loaded scripts in the system
    When the user initiates the clear cache command
    Then the system displays a warning message asking for user confirmation to clear cache despite loaded scripts
    And upon confirmation, the system clears the cache and logs the action

  Scenario: Scenario 2: Clear cache without loaded scripts
    Given there are no currently loaded scripts in the system
    When the user initiates the clear cache command
    Then the system responds with a message stating that no cache exists to clear

  Scenario: Scenario 3: Error during cache clearance
    Given an error occurs during cache clearance
    When the user initiates the clear cache command
    Then the system provides a descriptive error message detailing the issue
    And the system logs the error

  Scenario: Scenario 4: Successful cache clearance
    Given the cache clearance is successful
    When the user initiates the clear cache command
    Then the system displays a success message stating 'Cache has been cleared successfully.'
    And the system logs successful cache clearance action
