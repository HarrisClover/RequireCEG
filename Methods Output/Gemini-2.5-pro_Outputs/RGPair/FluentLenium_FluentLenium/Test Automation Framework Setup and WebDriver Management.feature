Feature: Test Automation Framework Setup and WebDriver Management
  As a Test Automation Engineer / Developer
  I need the test framework to manage WebDriver instances correctly and support various configurations
  So that tests are reliable, maintainable, and accurately reflect application behavior

  Background: Test Environment Context
    Given the test execution environment uses Cucumber with Java 8 support
    And the framework is designed to handle both single-class and multi-class step definitions

  Scenario: Correct WebDriver Lifecycle Management via Hooks
    Given a feature file requires browser interaction
    When the test execution for the feature begins
    Then a WebDriver instance should NOT be initialized before the 'Before' hook runs (initial state is null)
    And a single WebDriver instance should be initialized by the 'Before' hook for the feature
    And the same WebDriver instance should be available and maintained across all steps within a scenario
    And the WebDriver instance should be properly terminated by the 'After' hook after the feature execution completes

  Scenario: Tag-Based WebDriver Initialization
    Given a scenario is tagged with '@WebDriverRequired' # Example tag
    When the tagged scenario starts execution
    Then a WebDriver instance should be launched specifically for this scenario
    And browser interactions within the scenario steps should succeed

  Scenario: State Sharing Between Steps within a Scenario
    Given a scenario requires sharing data between steps
    And step 'A' performs an action and stores a result 'Result A' in the shared state
    When step 'B' executes within the same scenario
    Then step 'B' should be able to access 'Result A' from the shared state