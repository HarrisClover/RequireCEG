Feature: Full Access to Company Data
As a company user, I want to have full access to company data so that I can assess my company's performance.

Scenario for when a user should be granted full access
Scenario Outline: User is granted full access to company data
Given the user has "<access-privilege>" privilege
And the company data has "<data-restriction>" restrictions
When the user attempts to access company data
Then the user should be able to view all company data
Examples:
  | access-privilege | data-restriction   |
  | full access      | no restrictions    |
  | full access      | some restrictions  |
Scenario for when a user should not be granted full access
Scenario Outline: User is denied full access to company data
Given the user has "<access-privilege>" privilege
And the company data has "<data-restriction>" restrictions
When the user attempts to access company data
Then the user should not be able to view all company data
Examples:
  | access-privilege | data-restriction   |
  | partial access   | restricted         |
  | no access        | no restrictions    |
  | incorrect access | some restrictions  |

