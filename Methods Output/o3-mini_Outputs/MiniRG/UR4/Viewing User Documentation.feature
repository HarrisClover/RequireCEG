Feature: Viewing User Documentation
  As a user,
  I want to view the user documentation for the website
  So that I can know how to use the web app

Scenario: Documentation exists and is easy to understand
  Given the user documentation is available on the website
  And the user documentation is easy to understand
  When the user navigates to the documentation page
  Then the user should be able to understand how to use the web app

Scenario: Documentation does not exist
  Given the user documentation is not available on the website
  When the user navigates to the documentation page
  Then the user should not be able to understand how to use the web app

Scenario: Documentation page is down
  Given the user documentation is supposed to exist on the website
  And the user documentation page is down
  When the user attempts to access the documentation page
  Then the user should not be able to understand how to use the web app
