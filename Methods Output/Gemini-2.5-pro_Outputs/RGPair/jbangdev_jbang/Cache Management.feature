Feature: Cache Management
  As a jbang user,
  I want to manage the jbang cache,
  So that I can clear temporary files or resolve dependency issues.

  Scenario: Clearing the jbang cache
    Given jbang has previously downloaded dependencies and compiled scripts, populating the cache
    When I execute the command "jbang cache clear"
    Then the command should report that the cache has been cleared