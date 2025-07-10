Feature: Health Check API
As a system administrator,
I want to check the system's operational status via an API
So that I can verify that the system is functioning correctly.

Scenario: Health Check API returns a valid response
Given that the system is running
When a health check API request is made
Then the response status code should be 200
And the response body should not be empty

