Feature: Navigation and WebDriver Management
As a tester,
I want to verify that the system supports basic navigation and proper WebDriver management
So that I can ensure a seamless user experience across pages and maintain test reliability

Scenario: Navigating across multiple pages
Given the user is on the first page
When the user clicks on the 'next page' button
Then the user should be taken to the second page

Scenario: Verifying WebDriver instance management with hooks
Given the system is initialized with proper Before and After hooks for WebDriver
When a user interacts with the page
Then the WebDriver instance should be launched correctly with an initial null state
And the WebDriver should maintain state between steps

Scenario: Ensuring WebDriver is used once per feature
Given that the system is set up for testing with WebDriver
When running tests for a feature
Then the system should utilize a singular WebDriver instance per feature
And the WebDriver instance should be shared consistently across all steps

Scenario: Handling wait hooks for page transitions
Given the user is on the first page
When the user waits for the next page to load using wait hooks
Then the transition to the second page should be seamless
