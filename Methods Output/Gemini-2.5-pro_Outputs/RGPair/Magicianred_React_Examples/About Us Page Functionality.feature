Feature: About Us Page Functionality
  As a user
  I want to view the About Us page and its subsections
  So that I can learn more about the organization.

  Background:
    Given the user is on the "About Us" page

  Scenario: Viewing About Us Page Content and Sub-navigation
    Then the user should see information about the organization
    And the user should see navigation links or menus for "Who Are"
    And the user should see navigation links or menus for "Where Are"

  Scenario: Navigating to the 'Who Are' Subsection
    When the user navigates to the "Who Are" subsection
    Then the user should be on the "Who Are" page
    And the user should see details about the people involved

  Scenario: Navigating to the 'Where Are' Subsection
    When the user navigates to the "Where Are" subsection
    Then the user should be on the "Where Are" page
    And the user should see details about the locations