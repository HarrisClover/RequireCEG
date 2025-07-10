Feature: Accessing API for iOS Application Integration
As an iOS developer,
I want to access the API from the website,
So that I can integrate it and implement features in my iOS application.

Scenario: Accessing the API when it's free
Given that the API is free,
When I try to access the API,
Then I should be able to access the API.

Scenario: Accessing the API with a valid API key
Given that I have a valid API access key,
When I try to access the API,
Then I should be able to access the API.

Scenario: Accessing the API with an expired API key
Given that my API access key has expired,
When I try to access the API,
Then I should not be able to access the API,
And I should receive an error message indicating the key has expired.

Scenario: Accessing the API with an incorrect API key
Given that I have an incorrect API access key,
When I try to access the API,
Then I should not be able to access the API,
And I should receive an error message indicating the key is incorrect.

Scenario: Accessing the API with the correct permissions
Given that I have an API access key with the correct permissions,
When I try to access the API,
Then I should be able to access the API.