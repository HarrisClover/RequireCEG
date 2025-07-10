Feature: Authorization Control
  As a Security Team,
  I want access to resources to be strictly controlled based on user authorization levels
  So that users can only access data and perform actions they are permitted to.

  Scenario Outline: Verify Access Based on User Authorization
    Given a user with authorization level '<user_level>' is logged in
    When the user attempts to access the resource at '<resource_path>' which requires '<required_level>' level
    Then the access attempt should be '<access_outcome>'

    Examples:
      | user_level | resource_path      | required_level | access_outcome |
      | admin      | /admin/dashboard   | admin          | allowed        |
      | standard   | /admin/dashboard   | admin          | denied         |
      | standard   | /user/profile      | standard       | allowed        |
      | guest      | /user/profile      | standard       | denied         |
      | admin      | /user/profile      | standard       | allowed        | # Admins can usually access lower levels