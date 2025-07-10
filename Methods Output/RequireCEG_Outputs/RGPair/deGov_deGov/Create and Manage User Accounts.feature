Feature: Create and Manage User Accounts

  As an administrator
  I want to create new user accounts with specific access levels
  So that I can manage user permissions and account details effectively

  Background:
    Given the administrator is logged into the system
    And the system is ready to create a new user account

  Scenario: Scenario 1: Successful account creation
    Given the administrator inputs a valid username, password, and access level
    When the administrator submits the account creation form
    Then the system should create the user account
    And a confirmation message should be displayed to the administrator

  Scenario: Scenario 2: Missing fields
    Given the administrator submits the account creation form with empty fields
    When the form is validated
    Then the system should display an error message indicating which specific field is missing

  Scenario: Scenario 3: Duplicate username
    Given the administrator inputs a username that already exists in the database
    When the administrator submits the account creation form
    Then the system should alert the administrator that the username is already in use

  Scenario: Scenario 4: Administrator access level assignment
    Given the administrator selects an access level of 'Administrator'
    When the administrator creates a new user account
    Then the user should be granted permission to manage content and settings

  Scenario: Scenario 5: Editor access level assignment
    Given the administrator selects an access level of 'Editor'
    When the administrator creates a new user account
    Then the user should be granted permission to add, edit, and delete content without managing other user accounts

  Scenario: Scenario 6: User login redirection
    Given an anonymous user accesses the platform
    When the user enters their credentials and successfully logs in
    Then the user should be redirected to their personal dashboard

  Scenario: Scenario 7: Access level to functionality restriction
    Given the administrator creates a new user account with an access level of 'Administrator'
    Then the administrator must not assign 'Editor' access level to the same user
