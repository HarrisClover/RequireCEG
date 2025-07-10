Feature: Accessing Company Data

As a user with access privileges,
I want to access company data,
So that I can review the company's performance based on access restrictions.

Scenario Outline: Access Company Data Based on Privileges and Restrictions

Given that I have "<access-privilege>" access privileges
And the company data has "<data-restriction>"
When I attempt to access the company data
Then I should "<result>" have full access to the company data

Examples: | access-privilege | data-restriction | result | | full access | no restrictions | should | | full access | some restrictions | should | | no access | no restrictions | should not | | no access | some restrictions | should not |