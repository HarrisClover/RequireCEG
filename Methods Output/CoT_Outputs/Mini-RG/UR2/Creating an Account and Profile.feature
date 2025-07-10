Feature: Creating an Account and Profile
As a user,
I want to be able to create an account and a profile,
So that I can manage my personal information.

Scenario 1: Create an account if one does not exist
Given I do not have an account,
When I create a new account,
Then I should be able to successfully create an account.

Scenario 2: Create a profile after account creation
Given I have an existing account,
When I log into the system,
And I create a profile,
Then I should be able to successfully create a profile.

Scenario 3: Cannot create a profile without an account
Given I do not have an account,
When I try to create a profile,
Then I should be unable to create a profile.

Scenario 4: Cannot create a profile without a valid username and password
Given I have an account,
And I do not remember my username and/or password,
When I attempt to create a profile,
Then I should be unable to create a profile.