Feature: List Clusters

  As a user
  I want to list the available clusters in the system
  So that I can view cluster information based on my permissions

  Background:
    Given a user is authenticated in the system
    And the database might contain clusters

  Scenario: Scenario 1: No Clusters Exist
    Given the database has no clusters
    When the user requests to list clusters
    Then the system responds with a message indicating that no clusters exist
    And DIR (C1) = E1

  Scenario: Scenario 2: Clusters Exist and User Has Permissions
    Given the database has clusters
    And the user has the required permissions to access cluster information
    When the user requests to list clusters
    Then the system retrieves and presents detailed information about each cluster
    And AND (C1, C3) = E3

  Scenario: Scenario 3: Clusters Exist but User Lacks Permissions
    Given the database has clusters
    And the user lacks the necessary permissions to access cluster information
    When the user requests to list clusters
    Then the system responds with an access denied message
    And AND (C1, C4) = E4

  Scenario: Scenario 4: Error in Cluster Retrieval
    Given the database has clusters
    When the user requests to list clusters
    Then if there is an issue, the system generates an informative error message detailing the nature of the issue
    And NOT (C5) = E5

  Scenario: Scenario 5: User Permissions Check
    Given the database has clusters
    When the user requests to list clusters
    Then the system checks user permissions to access the cluster information
    And DIR (C1) = E2

  Scenario: Scenario 6: Mutually Exclusive Permissions
    Given the user is in the system
    When the user checks for permissions
    Then the user cannot have both required and lacking permissions simultaneously
    And EXC (C3, C4)
