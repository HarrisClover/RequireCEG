Feature: Prevent Voting on Closed Ballots

  As a voter
  I want to ensure I can only vote when the ballot is open
  So that I can participate in the election process without confusion

  Background:
    Given the ballot is either open or closed
    And the user is logged into the system

  Scenario: Attempting to vote on a closed ballot
    Given the ballot is closed
    When the user attempts to submit a vote
    Then the message should be 'Voting is not permitted on closed ballots.'

  Scenario: Casting a valid vote on an open ballot
    Given the ballot is open
    When the user submits a valid vote for a candidate
    Then the vote count for that candidate should be incremented
    And the system should display the message 'Your vote has been cast successfully.'

  Scenario: Requesting results on a closed ballot
    Given the ballot is closed
    When the user requests the results
    Then the system should provide full results including total vote counts and percentages.

  Scenario: Requesting results on an open ballot
    Given the ballot is open
    When the user requests the results
    Then the system should display the message 'Results can only be displayed for closed ballots.'

  Scenario: Handling no recorded votes
    Given there have been no votes cast
    When the user requests the results
    Then the system should alert with 'No votes have been cast.'

  Scenario: Determining a winner with tied votes
    Given there are tied vote counts among candidates
    When the election results are tallied
    Then the system should determine the winner based on registration dates of the candidates.

  Scenario: Initiating a second round of elections
    Given no candidate has received over 50% of the votes
    When the election results are concluded
    Then the system should initiate a second round and correctly identify candidates from the first round.

  Scenario: Attempting to vote with no votes recorded
    Given no votes have been recorded in the system
    When the user attempts to perform an action that violates voting rules
    Then the system should display an error message indicating the violation.
