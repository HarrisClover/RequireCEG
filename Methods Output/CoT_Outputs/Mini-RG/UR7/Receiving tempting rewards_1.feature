Feature: Receiving tempting rewards

  As a user,
  I want to receive tempting rewards if I want to use the website,
  So that I can enjoy the benefits of using the site.

  Scenario: User wants to use the website but does not want a reward
    Given the user wants to use the website
    And the user does not want to receive a tempting reward
    When the user accesses the website
    Then the user should not receive a tempting reward

