Feature: Check if Ballot is Closed

  As a voter
  I want to check the status of the ballot and obtain results
  So that I can effectively participate in the voting process

  Background:
    Given the ballot's current state is known
    And a user is logged into the system

  Scenario: Ballot is Closed
    Given the ballot is closed
    When a user checks the ballot status
    Then the system should respond with 'The ballot is closed; no further votes can be recorded.'

  Scenario: Ballot is Open
    Given the ballot is open
    When a user checks the ballot status
    Then the system should respond with 'The ballot is currently open; voting is still allowed.'

  Scenario: Request Results from Closed Ballot with Votes
    Given the ballot is closed
    And votes have been recorded for the closed ballot
    When a user requests the results
    Then the system should display the total count and percentage for each candidate

  Scenario: Request Results from Closed Ballot without Votes
    Given the ballot is closed
    And no votes have been recorded for the closed ballot
    When a user requests the results
    Then the system should respond with 'No votes have been recorded; results are unavailable.'

  Scenario: Request Results from Open Ballot
    Given the ballot is open
    When a user requests the results
    Then the system should respond with 'The results can only be obtained from closed ballots, please check back later.'

  Scenario: No Candidate has Majority
    Given the ballot is closed
    And no candidate has surpassed 50% of the votes
    When the results are tallied
    Then the system should indicate 'A second round of voting is required.'

  Scenario: Tie Among Candidates
    Given the ballot is closed
    And there is a tie among candidates
    When the registration dates are assessed
    Then the system should declare 'The winner is {candidate_name}, determined by registration date due to a tie.'

  Scenario: Voting Attempt during Closed Ballot
    Given the ballot is closed
    When a user attempts to vote
    Then the system should alert 'Voting is not permitted in a closed ballot.'

  Scenario: Request Results from Open Ballot - NO Votes
    Given the ballot is open
    And no votes have been recorded
    When a user requests the results
    Then the system should respond with 'The results can only be obtained from closed ballots, please check back later.'
