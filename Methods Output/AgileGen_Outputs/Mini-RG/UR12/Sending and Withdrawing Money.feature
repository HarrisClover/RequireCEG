Feature: Sending and Withdrawing Money
  As a user,
  I want to be able to send and withdraw money based on my age
  So that I can make transactions for my business

Scenario Outline: Sending and Withdrawing money based on age
  Given I am logged into the system
  And I am <age-group>
  When I attempt to send <amount> euros
  Then the transaction should <result>

Examples:
  | age-group | amount | result                           |
  | Adult     | 50     | succeed                          |
  | Adult     | 1000   | succeed                          |
  | Non-Adult | 10     | succeed                          |
  | Non-Adult | 30     | fail due to sending limit        |
  | Non-Adult | 20     | succeed                          |
  | Adult     | 0      | succeed                          |
  | Non-Adult | 0      | succeed                          |

Scenario: Withdrawing money as an adult
  Given I am logged into the system
  And I am an Adult
  When I attempt to withdraw money
  Then I should be able to withdraw the money

Scenario: Withdrawing money as a non-adult
  Given I am logged into the system
  And I am a Non-Adult
  When I attempt to withdraw money
  Then I should not be able to withdraw the money
