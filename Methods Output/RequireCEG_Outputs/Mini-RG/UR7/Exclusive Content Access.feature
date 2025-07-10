Feature: Exclusive Content Access

  As a website user
  I want to access tempting rewards
  So that I can benefit from exclusive offers

  Background:
    Given a user visits the website
    And the user expresses a desire to use the website

  Scenario: Access granted with desire for rewards
    Given the user expresses a desire to use the website
    And the user wishes to receive rewards
    When the system processes the request
    Then the user should be granted access to tempting rewards

  Scenario: Access denied without desire for rewards
    Given the user expresses a desire to use the website
    And the user does not wish to receive rewards
    When the system processes the request
    Then the user should be denied access to tempting rewards

  Scenario: Access denied without desire to use the website
    Given the user does not express a desire to use the website
    When the system processes the request
    Then the user should not be provided access to tempting rewards

  Scenario: User expresses a desire to use the website but does not want rewards
    Given the user expresses a desire to use the website
    And the user does not wish to receive rewards
    When the system processes the request
    Then the user should be denied access to tempting rewards

  Scenario Outline: User's decision on rewards
    Given the user has indicated a desire to use the website as <desire_to_use>
    And the user has indicated a desire to receive rewards as <desire_for_rewards>
    When the system processes the user's rewards request
    Then the access to tempting rewards should be <access_outcome>
    Examples:
      | desire_to_use | desire_for_rewards | access_outcome |
      | true | true | granted |
      | true | false | denied |
      | false | true | denied |
      | false | false | denied |

