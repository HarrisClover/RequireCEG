Feature: Sending and Withdrawing Money
  As a user,
  I want to send and withdraw money based on my age,
  So that I can manage my business transactions according to my eligibility.

Scenario: Sending money as an adult
  Given the user is an adult
  When the user sends money
  Then the transaction should be successful

Scenario: Sending money as a non-adult
  Given the user is a non-adult
  When the user attempts to send more than 20 euros
  Then the transaction should be denied

Scenario: Sending money as a non-adult (within limits)
  Given the user is a non-adult
  When the user sends 20 euros or less
  Then the transaction should be successful

Scenario: Withdrawing money as an adult
  Given the user is an adult
  When the user withdraws money
  Then the withdrawal should be successful

Scenario: Withdrawing money as a non-adult
  Given the user is a non-adult
  When the user attempts to withdraw money
  Then the withdrawal should be denied