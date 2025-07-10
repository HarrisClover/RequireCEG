Feature: Platform Specific Behavior (Windows Quoting)
  As a Windows user,
  I want jbang to correctly handle quoted arguments,
  So that I can pass arguments containing spaces or special characters reliably.

  Scenario: Passing quoted arguments on Windows
    Given a Java script file "ArgPrinter.java" that prints its arguments
    And the operating system is Windows
    When I execute the command `jbang ArgPrinter.java "first arg" second "third arg with spaces"`
    Then the standard output should contain "first arg"
    And the standard output should contain "second"
    And the standard output should contain "third arg with spaces"