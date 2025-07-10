Feature: Assign Access Levels and Permissions

  As an administrator
  I want to assign access levels and permissions to other users
  So that I can control user capabilities and maintain system security

  Background:
    Given a list of users with their current roles
    And an administrator is logged into the system

  Scenario: Scenario 1: Assign role to a user
    Given an administrator selects a user from the list
    And the administrator selects a new role for the user
    When the administrator assigns the new role
    Then the user receives a notification about their new access level and permissions
    And the permissions for that user are updated accordingly

  Scenario: Scenario 2: Non-administrator tries to access user management
    Given a user with the role of editor tries to access user management functionalities
    When the editor attempts to modify user roles
    Then the system displays an error message
    And the message states 'Insufficient access rights'

  Scenario: Scenario 3: Administrator updates user permissions
    Given an administrator selects a user for permission assignment
    When the administrator updates the user's permissions
    Then the access levels and permissions are assigned accordingly
    And the affected user receives a notification detailing their new access rights

  Scenario: Scenario 4: User management access attempt by non-admin
    Given the user trying to access user management functionalities is not an administrator
    When the user attempts to modify roles
    Then the system generates and displays the error message 'Insufficient access rights'

  Scenario Outline: Scenario Outline: Role Assignment and Validation
    Given a user has the role '<current-role>'
    And the administrator attempts to assign a role '<new-role>'
    When the administrator submits the changes
    Then the system should reflect '<expected-result>' and send notification
    Examples:
      | current-role | new-role | expected-result |
      | editor | viewer | successful assignment |
      | viewer | administrator | error due to insufficient rights |
      | administrator | editor | successful assignment |
      | editor | administrator | error due to insufficient rights |

