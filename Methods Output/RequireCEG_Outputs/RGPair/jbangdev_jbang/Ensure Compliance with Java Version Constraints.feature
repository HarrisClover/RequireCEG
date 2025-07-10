Feature: Ensure Compliance with Java Version Constraints

  As a system user
  I want to validate Java version requirements before executing scripts
  So that I can ensure compatibility and avoid potential errors during execution

  Background:
    Given the user is attempting to execute a script
    And the system has predefined Java version requirements

  Scenario: Scenario 1: Unsupported Java Version
    Given the current Java version is lower than the required version
    Then the system displays an error message stating that 'Java version [x] is not supported. Please install Java [y] or higher.'

  Scenario: Scenario 2: Version Warning
    Given the user executes a command specifying a particular Java version
    When the current Java version is lower than the specified version
    Then the system issues a warning stating 'Warning: This command requires Java version [z]. You are currently using Java [x].'

  Scenario: Scenario 3: Default Java Version Used
    Given the user submits a script without specifying a Java version
    Then the system defaults to the latest installed version and shows a notification 'Defaulting to latest Java version [x]. Please verify for compatibility with your script.'

  Scenario: Scenario 4: Execution Halted Due to Deprecated Features
    Given the script utilizes features from a deprecated Java version
    Then execution is halted and a detailed message is presented listing the deprecated features, e.g., 'Execution halted due to deprecated features: [list of features]. Consider using [recommended alternatives].'

  Scenario: Scenario 5: Successful Script Execution
    Given all version constraints are satisfied
    Then the system provides a message that confirms compliance: 'Script executed successfully with Java version [x]. All version constraints met.'

  Scenario: Scenario 6: Confirmation of Execution with No Deprecated Features
    Given the current Java version is adequate and does not use deprecated features
    Then the system confirms execution stating 'Script executed successfully with Java version [x]. All version constraints met.'
