Feature: Anonymous User Access
  As an Anonymous User
  I want to access basic pages like the start page, login, and sitemap
  So that I can navigate the public parts of the site and log in if needed.

  Scenario: Accessing the Start Page
    Given I am an anonymous user visiting the website
    When I navigate to the website's start page (homepage)
    Then I should see the content of the start page.

  Scenario: Navigating to the Login Page
    Given I am an anonymous user on the website's start page
    When I click on the "Login" link or button
    Then I should be redirected to the system's login page.

  Scenario: Navigating to the Sitemap Page
    Given I am an anonymous user on the website's start page
    When I click on the "Sitemap" link or button
    Then I should be redirected to the sitemap page.