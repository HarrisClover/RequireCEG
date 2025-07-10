Feature: Application Not Responding (ANR) Reporting
  As a developer,
  I want the application to report ANRs occurring in both JVM and CXX code
  So that I can identify and fix performance bottlenecks causing unresponsiveness.

  Scenario Outline: Reporting ANRs
    Given the error reporting system is initialized
    And configured to report ANRs
    When an ANR condition is triggered in the <environment> environment
    Then an ANR report should be sent
    And the report payload should indicate it's an ANR
    And the report payload should contain relevant thread state information for the <environment> environment
    And the report should include standard device and app metadata

    Examples:
      | environment |
      | JVM         |
      | CXX         | # Assuming CXX means NDK/Native context for ANR detection

