Feature: Manage User Role Configuration

  As an administrator
  I want to configure user roles and manage user permissions effectively
  So that I can ensure users have appropriate access to functionalities

  Background:
    Given the administrator is authenticated
    And the administrator has the necessary administrator permissions

  Scenario: Scenario 1: Assigning a privileged user role
    Given the administrator selects a user from the available list
    When the administrator assigns the role of 'Privileged User'
    Then the user's permissions should be updated to grant access to enhanced content management tasks
    And the system displays 'User role has been updated successfully'

  Scenario: Scenario 2: Assigning an administrator role
    Given the administrator selects a user from the available list
    When the administrator assigns the role of 'Administrator'
    Then the user should receive permissions to manage content types, add media, and configure cookie compliance settings
    And the system displays 'User role has been updated successfully'

  Scenario: Scenario 3: Attempting to assign conflicting role
    Given the administrator selects a user with existing roles that conflict with the assigned role
    When the administrator attempts to assign a conflicting role
    Then the system presents a warning message stating 'Insufficient privileges to assign this role'

  Scenario: Scenario 4: Anonymous User role access restrictions
    Given the administrator selects a user with the role 'Anonymous User'
    When the user accesses the system
    Then the user should see the following options: 'start page, login, sitemap'

  Scenario: Scenario 5: Privileged User role access
    Given the administrator selects a user with the role 'Privileged User'
    When the user accesses the system
    Then the user should see content management tasks

  Scenario: Scenario 6: Administrator role access
    Given the administrator selects a user with the role 'Administrator'
    When the user accesses the system
    Then the user should see options to manage content types, add media, and configure cookie compliance settings
