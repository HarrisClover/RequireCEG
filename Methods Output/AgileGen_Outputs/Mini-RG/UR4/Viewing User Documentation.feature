Feature: Viewing User Documentation
  As a user,
  I want to view the user documentation for the website
  So that I can know how to use the web app

  Scenario Outline: View User Documentation
    Given that the user documentation is available on the website
    And the user documentation page is accessible
    When I visit the user documentation page
    Then I should be able to know how to use the web app

  Scenario Outline: No User Documentation
    Given that there is no user documentation on the website
    When I visit the website
    Then I should not be able to know how to use the web app

  Scenario Outline: User Documentation Page Down
    Given that the user documentation page is down
    When I try to access the user documentation
    Then I should not be able to know how to use the web app
