Feature: Output Handling
  As a user of jbang,
  I want to receive clear standard output and standard error streams,
  So that I can understand the execution results and diagnose problems.

  Scenario: Capturing Standard Output
    Given a Java script file "StdOutOnly.java" that prints "Standard Output Message" to System.out
    When I execute the command "jbang StdOutOnly.java"
    Then the standard output should contain "Standard Output Message"
    And the standard error should be empty

  Scenario: Capturing Standard Error
    Given a Java script file "StdErrOnly.java" that prints "Error Output Message" to System.err
    When I execute the command "jbang StdErrOnly.java"
    Then the standard output should be empty
    And the standard error should contain "Error Output Message"

  Scenario: Capturing Mixed Output
    Given a Java script file "MixedOutput.java" that prints "Info" to System.out and "Warn" to System.err
    When I execute the command "jbang MixedOutput.java"
    Then the standard output should contain "Info"
    And the standard error should contain "Warn"