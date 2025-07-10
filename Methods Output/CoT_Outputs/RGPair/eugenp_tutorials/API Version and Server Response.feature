Feature: API Version and Server Response
As a user,
I want to retrieve version information and server responses
So that I can ensure the system is up-to-date.

Scenario: Retrieve API Version
Given that the system is running
When the user requests the API version
Then the response status code should be 200
And the version information should be returned correctly

Scenario: Retrieve Server Response
Given that the system is operational
When the user requests the server response
Then the response status code should be 200
And the server response should be returned correctly