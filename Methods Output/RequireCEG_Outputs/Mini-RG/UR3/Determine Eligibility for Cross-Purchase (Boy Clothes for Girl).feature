Feature: Determine Eligibility for Cross-Purchase (Boy Clothes for Girl)

  As a store owner
  I want to allow cross-purchase of clothing between boys and girls
  So that more clothing options are available for customers

  Background:
    Given a boy with a clothing size between 20 and 30
    And a girl with a clothing size between 20 and 25

  Scenario: Scenario 1: Girl can wear boy's clothes
    Given the boy's clothing size is 25
    And the girl's clothing size is 22
    When the girl tries to wear the boy's clothes
    Then the system should allow the girl to wear boy's clothes
    And display the message 'Girl can wear boy's clothes'

  Scenario: Scenario 2: Boy can wear girl's clothes
    Given the boy's clothing size is 23
    And the girl's clothing size is 25
    When the boy tries to wear the girl's clothes
    Then the system should allow the boy to wear girl's clothes
    And display the message 'Boy can wear girl's clothes'

  Scenario: Scenario 3: No suitable clothing for purchase
    Given the boy's clothing size is 30
    And the girl's clothing size is 26
    When the customers check clothing sizes
    Then the system should display the message 'No suitable clothing for purchase'

  Scenario: Scenario 4: Maximum size limits
    Given the boy's clothing size is 30
    And the girl's clothing size is 25
    When the customers check cross-purchase eligibility
    Then the system should display the message 'No suitable clothing for purchase'

  Scenario Outline: Scenario Outline: Cross-Purchase Eligibility
    Given the boy's clothing size is <boy-size>
    And the girl's clothing size is <girl-size>
    When the customers check cross-purchase eligibility
    Then the system should display <message>
    Examples:
      | boy-size | girl-size | message |
      | 25 | 22 | 'Girl can wear boy's clothes' |
      | 23 | 25 | 'Boy can wear girl's clothes' |
      | 30 | 26 | 'No suitable clothing for purchase' |

