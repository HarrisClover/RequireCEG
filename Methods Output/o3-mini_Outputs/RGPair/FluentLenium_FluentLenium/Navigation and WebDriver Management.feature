Feature: Navigation and WebDriver Management
As a tester, I want to ensure that the application supports navigation across multiple pages with robust WebDriver management so that tests run reliably using single- or multi-class step definitions.

Background:
Given the initial WebDriver instance is null
And the system is configured with appropriate Before and After hooks
And the test framework is set up to share state among steps

Scenario: Navigate from the first page to the second page
Given the user is on the first page
When the user clicks on the "next page" button
Then the system navigates to the second page
And the page transition is verified using wait hooks for seamless rendering

Scenario: Validate WebDriver instance management
Given a new test feature is initiated
And the WebDriver instance is launched using proper Before hooks
When the test steps execute using either single or multi-class step definitions
Then a single WebDriver instance is maintained for the feature
And the instance is correctly terminated using After hooks after the tests complete

Scenario: Ensure state sharing across test steps
Given the test begins with shared state between steps
And the WebDriver is initialized properly
When performing navigational actions between pages
Then the state is maintained across all steps
And no extra WebDriver instances are created during the feature execution