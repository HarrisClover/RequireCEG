Feature: Viewing Available Activity Fees Online
  As a user,
  I want to view available activity fees online,
  So that I can easily create or review a bill statement.

  # Scenario 1: Viewing some activity fees online when planning to create a bill statement.
  Scenario: Viewing some activity fees when creating a bill statement
    Given the system has some activity fees available online
    And I log into the system
    When I choose to create a bill statement
    Then I should see some of the available activity fees online

  # Scenario 2: Viewing all activity fees online when planning to create a bill statement.
  Scenario: Viewing all activity fees when creating a bill statement
    Given the system has all activity fees available online
    And I log into the system
    When I choose to create a bill statement
    Then I should see all the available activity fees online

  # Scenario 3: Viewing all activity fees online when not creating a bill statement.
  Scenario: Viewing all activity fees without creating a bill statement
    Given the system has all activity fees available online
    And I log into the system
    When I decide not to create a bill statement
    Then I should still see all the available activity fees online

  # Scenario 4: Handling network downtime.
  Scenario: Inability to view activity fees when the network is down
    Given the network is down
    When I attempt to view activity fees online
    Then I should not be able to view any activity fees online

  # Scenario 5: Handling the case where no activity fees are available online.
  Scenario: Inability to view activity fees when none are available online
    Given there are no activity fees available online
    And I log into the system
    When I try to view activity fees online
    Then I should not see any activity fees online
