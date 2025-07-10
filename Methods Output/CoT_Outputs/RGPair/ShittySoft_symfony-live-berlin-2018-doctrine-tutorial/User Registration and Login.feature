Feature: User Registration and Login
  As a user,
  I want to be able to register, log in, and log out securely,
  So that I can access the features of the application with my authenticated account

  Scenario: User registers with a valid email and password
    Given the user is on the registration page
    When the user provides a valid email and password
    And the user clicks on the "Register" button
    Then the user should be redirected to the login page
    And the user should see a confirmation message

  Scenario: User logs in with a valid email and password
    Given the user is on the login page
    When the user enters a valid email and password
    And the user clicks on the "Login" button
    Then the user should be redirected to the dashboard
    And the user should see a "Welcome" message

  Scenario: User attempts to log in with an incorrect password
    Given the user is on the login page
    When the user enters an incorrect password
    And the user clicks on the "Login" button
    Then the user should see an error message saying "Invalid email or password"
    And the user should remain on the login page
