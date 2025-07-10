Feature: Second Round Voting and Final Winner Determination
  As an election administrator
  I want to conduct a second round if necessary and determine the final winner
  So that the election concludes definitively.

  Background:
    Given a first round of voting occurred
    And no candidate achieved more than 50% of the vote
    And candidates "C1" (registered 2023-10-01) and "C2" (registered 2023-10-02) are eligible for the second round
    And a second round ballot is opened for candidates "C1" and "C2"

  Scenario: Determining the winner in the second round
    When the following second round votes are cast: C1: 5, C2: 3
    And the administrator closes the second round ballot
    And the administrator requests the final election results
    Then the second round ballot status should be "Closed"
    And the final winner should be declared as "C1"

  Scenario: Determining the winner in the second round with a tie resolved by registration date
    When the following second round votes are cast: C1: 4, C2: 4
    And the administrator closes the second round ballot
    And the administrator requests the final election results
    Then the second round ballot status should be "Closed"
    And the final winner should be declared as "C1" based on earlier registration date

  Scenario: Attempting to vote after the second round ballot is closed
    Given the second round ballot is closed
    When a voter attempts to cast a vote for candidate "C1" in the second round
    Then the vote should be rejected
    And the system should provide an error message indicating "Second round voting is closed"
    And the second round vote counts should remain unchanged