Feature: User Documentation for the Web App
  As a user,
  I want to view user documentation for the website,
  So that I can know how to use the web app.

Scenario: User documentation is available and easy to understand
  Given the user documentation is available
  And the user documentation is easy to understand
  When the user accesses the user documentation
  Then the user should be able to know how to use the web app

Scenario: User documentation is not available
  Given the user documentation is not available
  When the user tries to access the user documentation
  Then the user should not be able to know how to use the web app

Scenario: User documentation page is down
  Given the user documentation page is down
  When the user tries to access the user documentation
  Then the user should not be able to know how to use the web app
