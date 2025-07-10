Feature: Age Validation Error Notification

  As a user
  I want to ensure that age restrictions on sending and withdrawing funds are enforced
  So that non-adult users cannot make unauthorized transactions

  Background:
    Given the user is logged into the system
    And the user provides their age

  Scenario: Scenario 1: Non-adult user attempts to send over limit
    Given the user is a non-adult
    When the user attempts to send 30 euros
    Then the system should reject the transaction
    And print 'The maximum send limit for non-adults is 20 euros.'

  Scenario: Scenario 2: Non-adult user attempts to withdraw funds
    Given the user is a non-adult
    When the user attempts to withdraw 10 euros
    Then the system should reject the transaction
    And display 'Non-adults cannot withdraw funds.'

  Scenario: Scenario 3: Adult user sends funds
    Given the user is an adult
    When the user attempts to send 50 euros
    Then the transaction should be processed successfully

  Scenario Outline: Scenario Outline: Non-adult transaction limits
    Given the user is a non-adult
    And the maximum send limit is <limit> euros
    When the user attempts to send <amount> euros
    Then the system should <outcome>
    Examples:
      | limit | amount | outcome |
      | 20 | 25 | reject the transaction and print 'The maximum send limit for non-adults is 20 euros.' |
      | 20 | 15 | process the transaction successfully |


  Scenario: Scenario 4: Non-adult user who attempts to withdraw funds
    Given the user is a non-adult
    When the user attempts to withdraw any amount
    Then the system should reject the withdrawal request
    And print 'Non-adults cannot withdraw funds.'
