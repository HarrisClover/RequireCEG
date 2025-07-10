Feature: RESTful API for Project Data
As a user,
I want to upload and retrieve project data via an API
So that I can manage project information efficiently.

Scenario: Upload Project Data
Given that the project data is valid
When the user uploads the project data via the API
Then the response status code should be 200
And the project data should be saved correctly

Scenario: Retrieve Project Data
Given that the project data exists
When the user retrieves the project data via the API
Then the response status code should be 200
And the project data should be returned correctly

