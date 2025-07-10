Feature: Run Java Scripts with stdout and stderr Outputs

  As a user
  I want to execute Java scripts successfully with proper output handling
  So that I can see results and errors clearly

  Background:
    Given the user has initialized the Java script
    And the system is ready to run scripts

  Scenario: Successful script execution
    Given a valid Java script is present
    When the user executes the script
    Then the standard output is displayed
    And the execution outcome indicates success

  Scenario: Script execution with error
    Given a Java script contains syntax errors
    When the user executes the script
    Then the standard error output is displayed
    And the error message describes the syntax error

  Scenario: Re-execution of modified script
    Given the user modifies a previously executed script
    When the user re-executes the script
    Then the output reflects the latest execution
    And overrides any previous outputs

  Scenario: Execution without initialization
    Given the Java script has not been initialized
    When the user attempts to execute the script
    Then the system presents an appropriate error message
    And indicates that the script is not ready to run

  Scenario: Clearing caches before execution
    Given the user opts to clear caches before running the script
    When the user executes the Java script
    Then the outputs from previous executions are ignored
    And the results reflect a clean execution

  Scenario Outline: Managing scripts in different environments
    Given the user stores scripts in local and portable options
    And the environment is set to <environment>
    When the user executes a script in <environment>
    Then the output informs the user of the execution state
    And no conflicts arise between environments
    Examples:
      | environment | execution state |
      | local | local environment execution successful |
      | portable | portable environment execution successful |

