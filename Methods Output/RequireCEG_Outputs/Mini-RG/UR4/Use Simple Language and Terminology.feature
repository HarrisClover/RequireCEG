Feature: Use Simple Language and Terminology

  As a user
  I want to access user documentation on the website
  So that I can understand how to use the web app

  Background:
    Given the user is on the documentation page
    And the user has an internet connection

  Scenario: Scenario 1: Documentation is available
    Given the user documentation is available
    When the user accesses the documentation page
    Then the content is presented in simple language and terminology
    And the user can easily understand how to use the web app

  Scenario: Scenario 2: Documentation is down
    Given the documentation page is down
    When the user tries to access the documentation
    Then an error message is displayed stating that the documentation is currently unavailable

  Scenario: Scenario 3: No documentation exists
    Given there is no user documentation on the website
    When the user attempts to access the documentation
    Then a message indicates that the user cannot know how to use the web app

  Scenario: Scenario 4: Documentation logic check
    Given the user documentation is available
    When the user accesses the documentation page
    Then the content is presented in simple language and terminology
    And the user cannot see an error message about documentation being unavailable

  Scenario: Scenario 5: Error message when documentation is unavailable
    Given the documentation page is down
    When the user tries to access the documentation
    Then an error message is displayed stating that the documentation is currently unavailable
    And the user cannot access the documentation content

  Scenario: Scenario 6: Invalid documentation presence check
    Given there is no user documentation on the website
    When the user attempts to access the documentation
    Then a message indicates that the user cannot know how to use the web app
    And no error message is generated about documentation being available
