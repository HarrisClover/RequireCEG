Feature: System Configuration Verification
  As an Administrator
  I want to verify key system configurations
  So that I can ensure the site operates correctly and complies with standards.

  Scenario: Verify Cookie Compliance Configuration
    Given I am logged in as an Administrator
    When I navigate to the Cookie Compliance settings section
    Then the system should indicate that cookie compliance is configured appropriately
    # This 'Then' step might need more specific checks depending on the exact settings (e.g., banner enabled, policy link set)

  Scenario: Verify Search Index Configuration
    Given I am logged in as an Administrator
    When I navigate to the Search Index configuration section
    Then the search index status should indicate it is active and properly configured.
    # This 'Then' step might need more specific checks (e.g., content types indexed, cron running)

  Scenario: Verify Essential Menu Links
    Given I am logged in as an Administrator
    When I inspect the configuration of the main navigation menu
    Then the menu should contain links for "Login" and "Sitemap".
    # Add other essential links as needed

