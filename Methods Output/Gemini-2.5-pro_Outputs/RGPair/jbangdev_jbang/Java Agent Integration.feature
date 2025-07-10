Feature: Java Agent Integration
  As a jbang user,
  I want to attach Java agents when running scripts or JARs,
  So that I can perform bytecode instrumentation or monitoring.

  Scenario: Running a script with a Java agent
    Given a Java script file "MainApp.java"
    And a Java agent JAR file "myAgent.jar"
    When I execute the command "jbang --javaagent=myAgent.jar MainApp.java"
    Then the script "MainApp.java" should execute
    And the effects of "myAgent.jar" should be observable (e.g., specific log output from the agent)