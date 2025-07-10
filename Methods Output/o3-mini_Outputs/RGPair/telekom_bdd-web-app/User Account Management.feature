Feature: User Account Management  
As a user, I want to register and log in so that I can access the taxi reservation functionality.

  Scenario: Successful Registration  
    Given the user navigates to the registration page  
    When the user enters valid personal details including a unique username, a valid email address, and a secure password  
    And the user submits the registration form  
    Then the system validates the input data  
    And the system displays a success message confirming the registration  
    And the user is redirected to the login page  

  Scenario: Registration with Invalid Data  
    Given the user navigates to the registration page  
    When the user enters invalid or incomplete personal details  
    And the user submits the registration form  
    Then the system validates the input data  
    And the system displays appropriate error messages for each invalid field  
    And the registration is not processed  

  Scenario: Successful Login  
    Given the user is on the login page  
    When the user provides valid credentials  
    And the user submits the login form  
    Then the system verifies the credentials  
    And the user is successfully logged in  
    And a distinct user session is established  

  Scenario: Login with Invalid Credentials  
    Given the user is on the login page  
    When the user provides invalid credentials  
    And the user submits the login form  
    Then the system verifies the credentials  
    And the system displays an error message indicating a login failure  

