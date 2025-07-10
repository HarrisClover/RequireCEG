Feature: Session Management Across Test Environments  
As a system administrator or tester, I want the application to maintain distinct user sessions across test environments to ensure consistent behavior.

  Scenario: Maintaining Distinct User Sessions  
    Given multiple users are logged in from different test environments  
    When each user performs actions such as login, registration, and reservation  
    Then the system maintains separate sessions for each user  
    And the system handles session state appropriately despite potential application errors  