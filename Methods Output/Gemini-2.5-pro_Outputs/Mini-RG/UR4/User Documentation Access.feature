Feature: User Documentation Access
  As a user of the website
  I want to view user documentation
  So that I can understand how to use the web app

  Scenario: Successfully accessing available and understandable documentation
    Given I am on the website
    And user documentation is available on the website
    And the user documentation is easy to understand
    When I navigate to the user documentation section
    Then I should be able to view the user documentation
    And I should be able to understand how to use the web app

  Scenario: Attempting to access documentation when none exists
    Given I am on the website
    And there is no user documentation available on the website
    When I look for the user documentation section
    Then I should not be able to find any user documentation
    And I should not be able to understand how to use the web app (from the documentation)

  Scenario: Attempting to access documentation when the page is down
    Given I am on the website
    And user documentation exists but the documentation page is currently down
    When I attempt to navigate to the user documentation section
    Then I should not be able to view the user documentation
    And I should see an indication that the page is unavailable (e.g., an error message)
    And I should not be able to understand how to use the web app (from the documentation)

  # Optional: Scenario focusing specifically on understandability (could be combined with the first scenario)
  Scenario: Accessing documentation that is difficult to understand
    Given I am on the website
    And user documentation is available on the website
    And the user documentation is difficult to understand
    When I navigate to the user documentation section
    And I attempt to read the documentation
    Then I should be able to view the user documentation
    But I should struggle or be unable to understand how to use the web app based on the documentation provided