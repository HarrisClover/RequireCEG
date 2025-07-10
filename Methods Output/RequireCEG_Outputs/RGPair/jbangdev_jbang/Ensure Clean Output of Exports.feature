Feature: Ensure Clean Output of Exports

  As a user managing export processes
  I want to ensure that all required files and parameters are validated during export
  So that I can avoid errors and produce clean, functional exports

  Background:
    Given the export process is initiated
    And all necessary files and parameters are ready

  Scenario: Validate Required Files and Parameters
    Given the required files are present
    And the parameters are correctly specified
    When the export process runs
    Then the operation proceeds without errors
    And a success message is displayed

  Scenario: Missing Required Files
    Given one or more required files are missing
    When the export process is initiated
    Then an error message is generated indicating the missing files

  Scenario: Incorrect Parameters
    Given the parameters provided are incorrect
    When the export process is initiated
    Then an error message is displayed specifying the incorrect parameters

  Scenario: Check for Deprecated Commands
    Given the export script contains deprecated commands
    When the export process runs
    Then the user is notified of deprecated commands found in the script
    And the export does not include these commands

  Scenario: Verify Output Directory Structure
    Given the output directory structure is incorrect
    When the export process is initiated
    Then the user is informed about the incorrect directory structure

  Scenario: Ensure Clean Output Separating Artifacts
    Given the portable scripts are selected for export
    And all necessary dependencies are included
    When the export process runs
    Then the output maintains clarity by separating portable artifacts from local artifacts

  Scenario Outline: Ensure Compatibility with Java Version
    Given the export adheres to specified Java version constraints
    And the output is properly formatted
    When the export process runs
    Then the export is compatible with the specified Java version
    And the output maintains a consistent formatting style
    Examples:
      | Java Version | Output Format | Status |
      | Java 11 | Formatted | Success |
      | Java 8 | Consistent | Success |
      | Java 15 | Formatted | Failure |
      | Java 17 | Consistent | Success |

