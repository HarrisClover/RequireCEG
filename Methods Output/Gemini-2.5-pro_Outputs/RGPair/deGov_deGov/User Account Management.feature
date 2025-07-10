Feature: User Account Management
  As an Administrator
  I want to create and manage user accounts and access levels
  So that I can control who can access administrative functionalities.

  Scenario: Create a New User Account with a Specific Role
    Given I am logged in as an Administrator
    When I navigate to the user management section
    And I initiate the creation of a new user
    And I provide the necessary details for the user "neweditor"
    And I assign the role "Editor" to "neweditor"
    And I save the new user account
    Then the user account "neweditor" should exist in the system
    And the user "neweditor" should have the "Editor" role assigned.

  Scenario: Verify Access Levels for Administrative Functions
    Given a user with the "<Role>" role is logged in
    When the user attempts to access the "<AdministrativeArea>"
    Then access should be "<AccessResult>"

    Examples:
      | Role          | AdministrativeArea         | AccessResult |
      | Administrator | User Management            | Granted      |
      | Administrator | Content Type Configuration | Granted      |
      | Editor        | User Management            | Denied       |
      | Editor        | Add/Edit Own Content       | Granted      | # Assuming Editors can edit content

