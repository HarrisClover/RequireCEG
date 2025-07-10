Feature: Receiving tempting rewards

  As a user,
  I want to receive tempting rewards if I want to use the website,
  So that I can enjoy the benefits of using the site.

  Scenario: User does not want to use the website and should not get a reward
    Given the user does not want to use the website
    When the user attempts to access the website
    Then the user should not receive a tempting reward
