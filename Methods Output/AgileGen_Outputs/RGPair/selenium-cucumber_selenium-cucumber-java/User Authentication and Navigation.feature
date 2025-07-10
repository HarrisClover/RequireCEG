Feature: User Authentication and Navigation
  As a user,
  I want to log in to the Homerunner platform, use Gmail, and navigate Wikipedia
  So that I can have a seamless experience across different platforms

Scenario: Logging into the Homerunner platform
  Given that the user is on the Homerunner homepage
  When the user clicks the "Get Started" button
  Then the user should be redirected to the login page
  And the user should be able to log in by entering their first name
  And after entering the first name, the family name field should not be presented

Scenario: Logging into Gmail
  Given that the user is on the Gmail login page
  When the user enters valid Gmail credentials and clicks "Login"
  Then the user should be logged into Gmail
  And the logout link should be visible
  
Scenario: Logging out from Gmail
  Given that the user is logged into Gmail
  When the user clicks on the logout link
  Then the user should be logged out
  And the username input field should become visible again

Scenario: Refreshing the page after logging in
  Given that the user is logged into Gmail
  When the user refreshes the page
  Then the logout link should remain visible
  And the user should remain logged in

Scenario: Logging back into Gmail
  Given that the user is logged out of Gmail
  When the user enters the same valid Gmail credentials
  Then the user should be logged in again
  And the logout link should be visible
  
Scenario: Navigating to Wikipedia
  Given that the user is not logged into any platform
  When the user navigates to Wikipedia
  And the user selects a language from the dropdown
  And the user enters a search term in the search input field
  Or the user clicks on the search button
  Then the search results should be displayed
  And the user should be able to close the browser after a brief wait
