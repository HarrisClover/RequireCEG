Feature: Catalog Management
  As a jbang user,
  I want to manage alias catalogs,
  So that I can easily run scripts using short aliases.

  Scenario: Adding an alias catalog
    Given a valid alias catalog URL "https://example.com/jbang-catalog.json"
    When I execute the command "jbang catalog add mycat https://example.com/jbang-catalog.json"
    Then the command should succeed
    And the catalog "mycat" should be listed when running "jbang catalog list"

  Scenario: Listing alias catalogs
    Given the alias catalog "mycat" has been added
    When I execute the command "jbang catalog list"
    Then the standard output should contain the name "mycat" and its URL

  Scenario: Removing an alias catalog
    Given the alias catalog "mycat" has been added
    When I execute the command "jbang catalog remove mycat"
    Then the command should succeed
    And the catalog "mycat" should not be listed when running "jbang catalog list"

  Scenario: Running an alias from a catalog
    Given the alias catalog "mycat" containing an alias "hello" for "HelloWorld.java" has been added
    And the script "HelloWorld.java" prints "Hello from alias!"
    When I execute the command "jbang hello@mycat"
    Then the standard output should contain "Hello from alias!"