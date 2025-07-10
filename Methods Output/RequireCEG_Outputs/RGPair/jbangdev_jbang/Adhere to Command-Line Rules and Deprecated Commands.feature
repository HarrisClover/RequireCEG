Feature: Adhere to Command-Line Rules and Deprecated Commands

  As a system user
  I want the system to validate my input commands for proper syntax and deprecated parameters
  So that I can ensure successful execution of valid commands and receive clear feedback on any issues

  Background:
    Given the system is running
    And there are established command-line rules

  Scenario: Input with valid syntax and no deprecated parameters
    Given a command 'add-item --name TeaShirt --price 100'
    When the user executes the command
    Then the system should process the command successfully
    And the output should not display any warnings

  Scenario: Input with deprecated parameters
    Given a command 'add-item --name TeaShirt --cost 100'
    When the user executes the command
    Then the system should process the command successfully
    And the system should display a warning indicating that '--cost' is deprecated

  Scenario: Input with invalid syntax
    Given a command 'add-item name TeaShirt price=100'
    When the user attempts to execute the command
    Then the system should reject the command
    And the output should display an error message detailing the specific syntax issue

  Scenario: Input with correctly formatted quotes in Windows environment
    Given a command 'add-item "TeaShirt" --price 100'
    When the user executes the command
    Then the system should handle the quotation marks correctly
    And the command should execute without errors

  Scenario: Input with incorrect quotes in Windows environment
    Given a command 'add-item "TeaShirt --price 100'
    When the user executes the command
    Then the system should reject the command
    And the output should display an error message detailing the quotation issue

  Scenario: Input with multiple parameters and no deprecated commands
    Given a command 'add-item --name TeaShirt --price 100 --category clothing'
    When the user executes the command
    Then the system should process all parameters successfully
    And the output should confirm all parameters were accepted
