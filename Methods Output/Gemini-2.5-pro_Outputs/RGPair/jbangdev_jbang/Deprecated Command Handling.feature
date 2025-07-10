Feature: Deprecated Command Handling
  As a jbang user,
  I want to be notified when using deprecated commands,
  So that I can update my usage to the recommended commands.

  Scenario: Using a deprecated command
    Given "oldcmd" is a deprecated jbang command aliased to "newcmd"
    When I execute the command "jbang oldcmd"
    Then the command should execute successfully (as "newcmd")
    And the standard error should contain a warning message indicating "oldcmd" is deprecated and suggesting "newcmd"