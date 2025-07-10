Feature: User Documentation Availability

  As a user
  I want to access user documentation readily
  So that I can effectively learn how to utilize the web app

  Background:
    Given the user documentation is hosted on the website
    And the user is logged into the web application

  Scenario: Scenario 1: Documentation is available
    Given the user documentation is available
    When the user navigates to the documentation page
    Then the documentation should be displayed
    And the user should be able to understand how to use the web app

  Scenario: Scenario 2: Documentation is not available
    Given the user documentation is not available
    When the user tries to access the documentation page
    Then the system should present the message 'User documentation is not available. Please contact support for assistance.'

  Scenario: Scenario 3: Documentation page is down
    Given the user documentation page is down
    When the user attempts to view the documentation
    Then the system should display the message 'User documentation is currently unavailable. Please try again later.'

  Scenario: Scenario 4: Documentation is easy to understand
    Given the user documentation is available
    And the user documentation is easy to understand
    When the user navigates to the documentation page
    Then the documentation should be displayed
    And the user should be able to effectively learn how to utilize the web app

  Scenario: Scenario 5: Documentation is available but hard to understand
    Given the user documentation is available
    And the user documentation is not easy to understand
    When the user navigates to the documentation page
    Then the documentation should be displayed
    And the user should struggle to understand how to use the web app
