Feature: Full Access to Company Data
  As a user with specific privileges,
  I want to have full access to company data,
  So that I can evaluate my company's performance based on the data available.

Scenario Outline: Accessing company data based on privileges and restrictions
  Given that the user has <access-privilege> to the data
  And the company data has <access-restrictions>
  When the user attempts to access company data
  Then the user should be able to have full access to company data if the access privilege allows
  And the user should not be able to have full access to company data if the access privilege does not allow

Examples:
  | access-privilege   | access-restrictions  |
  | full               | no restrictions      |
  | full               | some restrictions    |
  | no full access     | no restrictions      |
  | no full access     | some restrictions    |
