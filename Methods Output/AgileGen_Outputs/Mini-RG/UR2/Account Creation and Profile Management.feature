Feature: Account Creation and Profile Management
  As a user,
  I want to create an account and profile,
  So that I can have my own personal profile on the system.

Scenario: Creating an account when none exists
  Given I do not have an account
  When I try to create an account
  Then my account should be created successfully

Scenario: Creating a profile with an existing account
  Given I have an account
  When I try to create a profile
  Then my profile should be created successfully

Scenario: Trying to create a profile without an account
  Given I do not have an account
  When I try to create a profile
  Then I should not be able to create a profile

Scenario: Trying to create a profile without remembering my account username and password
  Given I have an account
  And I do not remember my username or password
  When I try to create a profile
  Then I should not be able to create a profile
