Feature: Wrapper Management
  As a jbang user,
  I want to create wrappers for my scripts,
  So that they can be executed easily without needing jbang installed everywhere (using the wrapper script).

  Scenario: Creating a script wrapper
    Given a Java script file "MyApp.java" exists
    And no wrapper script exists in the current directory
    When I execute the command "jbang wrapper MyApp.java"
    Then wrapper scripts (e.g., "myapp", "myapp.cmd") should be created in the current directory
    And the command output should indicate successful wrapper creation

  Scenario: Attempting to create a wrapper when one already exists
    Given a Java script file "MyApp.java" exists
    And wrapper scripts for "MyApp.java" already exist in the current directory
    When I execute the command "jbang wrapper MyApp.java"
    Then the command should fail or prompt for overwrite (depending on implementation)
    And the standard error should contain a message indicating the wrapper already exists

  Scenario: Attempting to create a wrapper with incorrect directory structure (if applicable)
    # This depends on specific constraints jbang might impose on wrapper locations
    Given a Java script file "MyApp.java" exists
    And the target directory structure for the wrapper is invalid (e.g., permissions issue, non-existent path specified via an option)
    When I attempt to create a wrapper with the invalid structure using "jbang wrapper --output /invalid/path MyApp.java"
    Then the command should fail
    And the standard error should contain a message about the invalid directory structure or permissions