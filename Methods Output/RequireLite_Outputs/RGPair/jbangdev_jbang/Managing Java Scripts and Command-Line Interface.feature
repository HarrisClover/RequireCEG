Feature: Managing Java Scripts and Command-Line Interface

  As a user of the jbang command-line interface
  I want to initialize, edit, and run Java scripts effortlessly
  So that I can manage my scripts and dependencies effectively

  Background:
    Given the user has the jbang command-line interface installed
    And the user is logged into the system

  Scenario: Scenario 1: Initialize a valid Java script
    Given the user has a valid Java script file
    When the user initializes the script using the jbang command
    Then the script should be correctly initialized
    And the output should display the success message

  Scenario: Scenario 2: Initialize an invalid Java script
    Given the user has an invalid Java script file
    When the user initializes the script using the jbang command
    Then the script should not be initialized
    And the output should display an error message

  Scenario: Scenario 3: Edit a script
    Given the user has an existing script and the necessary permissions
    When the user edits the script using a text editor
    Then the script should reflect the changes made
    And the user saves the changes

  Scenario: Scenario 4: Run a script
    Given the user has an initialized and editable script
    When the user runs the script using the jbang command
    Then the script should execute without error messages

  Scenario: Scenario 5: Run a non-initialized script
    Given the user has a non-initialized script
    When the user runs the script using the jbang command
    Then the script should not execute
    And the output should display an error message

  Scenario Outline: Scenario Outline: Handle command-line functionalities
    Given the user interacts with the command-line interface
    When the user executes the <command>
    Then the output should be displayed on stdout
    And if there is an error, it should be outputted on stderr
    Examples:
      | command | parameter | expected-output |
      | initialize | script.java | Success message |
      | run | script.java | Execution outputs |
      | clear-cache |  | Cache cleared message |
      | manage-catalog | catalog.json | Catalog managed message |
      | initialize | invalid-script.java | Error message |
      | run | non-initialized-script.java | Error message |


  Scenario: Scenario 6: Unauthorized access when not logged in
    Given the user is not logged into the system
    When the user tries to initialize a script using the jbang command
    Then the action should be denied
    And the output should display a login required message
