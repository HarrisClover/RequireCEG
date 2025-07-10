Feature: JAR Execution
  As a jbang user,
  I want to launch pre-compiled JAR files using jbang,
  So that I can leverage jbang's environment setup for JARs.

  Scenario: Running a simple JAR file
    Given a JAR file "myApp.jar" with a main class that prints "JAR executed"
    When I execute the command "jbang myApp.jar"
    Then the standard output should contain "JAR executed"

  Scenario: Running a JAR file with arguments
    Given a JAR file "myApp.jar" with a main class that prints its arguments
    When I execute the command "jbang myApp.jar arg1 arg2"
    Then the standard output should contain "arg1"
    And the standard output should contain "arg2"