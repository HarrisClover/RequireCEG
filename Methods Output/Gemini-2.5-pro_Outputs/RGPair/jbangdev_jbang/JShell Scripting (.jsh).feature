Feature: JShell Scripting (.jsh)
  As a jbang user,
  I want to execute JShell scripts (.jsh files),
  So that I can run Java snippets and commands interactively or via script.

  Scenario: Running a simple JShell script
    Given a JShell script file "hello.jsh" containing `System.out.println("Hello from JShell");`
    When I execute the command "jbang hello.jsh"
    Then the standard output should contain "Hello from JShell"