Feature: Access Start Page

  As an anonymous visitor
  I want to access the start page without restrictions
  So that I can view the available options before logging in

  Background:
    Given the user accesses the start page
    And the user is an anonymous visitor

  Scenario: Visitor Accessing Start Page
    Given the user is an anonymous visitor
    When the user accesses the start page
    Then visible links to the login page and the sitemap are displayed clearly
    And the user is allowed access to the start page without restrictions

  Scenario: Clicking Login Link
    Given the user is on the start page
    When the user clicks on the login link
    Then the user is redirected to the login interface with prompts for credentials

  Scenario: Clicking Sitemap Link
    Given the user is on the start page
    When the user clicks on the sitemap link
    Then the user is redirected to the sitemap page displaying all sections of the website

  Scenario: Recognized Session
    Given the user has previously logged in
    When the user accesses the start page
    Then the login option is hidden
    And a personalized welcome message is displayed along with links to user profile options

  Scenario: Session Not Recognized
    Given the user is an anonymous visitor
    When the user accesses the start page
    Then the login option is displayed clearly
    And the user is provided with links to the login page and sitemap
