Feature: Clear Export of Scripts for Local and Portable Use

  As a user of the system
  I want to choose between local and portable export options for scripts
  So that I can manage my script exports effectively

  Background:
    Given the user has a script ready for export
    And the user has defined their preferences for local or portable export

  Scenario: Scenario 1: Local Export with Correct Directory Structure
    Given the user selects local export option
    And the directory structure is correct
    When the user initiates the export process
    Then the script should be saved in the predefined directory
    And the confirmation message should be displayed

  Scenario: Scenario 2: Local Export with Incorrect Directory Structure
    Given the user selects local export option
    And the directory structure is incorrect
    When the user initiates the export process
    Then the system should present an error notification
    And the notification should outline the specific issue with the directory

  Scenario: Scenario 3: Portable Export with Correct Scripts
    Given the user selects portable export option
    And all necessary dependencies are met
    When the user initiates the export process
    Then the system should package all necessary dependencies
    And a success message should confirm the creation of the portable script

  Scenario: Scenario 4: Export Failure Due to Missing Dependencies
    Given the user tries to export a script
    And the script has unsaved changes or missing dependencies
    When the user initiates the export process
    Then the system should return an error message
    And the message should detail the reasons for the failure

  Scenario: Scenario 5: Directory Structure Error Notification
    Given the user selects local export option
    And the directory structure is incorrect
    When the user initiates the export process
    Then the system should present an error notification
    And the notification should outline the specific issue with the directory

  Scenario Outline: Scenario Outline: Existing Wrappers Alert
    Given the user has existing wrappers for the script
    When the user attempts to overwrite the existing files
    Then the system should alert the user
    Examples:
      | existing wrappers | overwrite attempt |
      | Wrapper1 | attempt to overwrite Wrapper1 |
      | Wrapper2 | attempt to overwrite Wrapper2 |

