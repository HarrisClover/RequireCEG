Feature: Script Export
  As a jbang user,
  I want to export scripts with their dependencies,
  So that I can distribute them easily.

  Scenario: Exporting a script locally
    Given a Java script file "ExportApp.java" with dependencies
    When I execute the command "jbang export local ExportApp.java"
    Then a local runnable artifact (e.g., a directory structure or fat JAR) should be created
    And the command output should indicate the location of the exported artifact

  Scenario: Exporting a script portably
    Given a Java script file "ExportApp.java" with dependencies
    When I execute the command "jbang export portable ExportApp.java"
    Then a portable runnable artifact (e.g., a zip file) should be created
    And the command output should indicate the location of the exported artifact

  Scenario: Ensuring clean export output
    Given a Java script file "ExportApp.java"
    When I execute an export command like "jbang export local ExportApp.java"
    Then the standard output should clearly indicate the result and location
    And the standard output should not contain excessive debug information unless requested (e.g., via a --verbose flag)