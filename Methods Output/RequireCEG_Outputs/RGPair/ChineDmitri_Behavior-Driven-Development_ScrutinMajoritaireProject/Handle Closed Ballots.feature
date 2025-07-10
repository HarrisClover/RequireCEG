Feature: Handle Closed Ballots

  As a voter
  I want to know when I can vote and access results
  So that I can participate effectively in the election process

  Background:
    Given there is an open ballot
    And the voting system is operational

  Scenario: Attempt Voting When Ballot is Closed
    Given the ballot is closed
    When a user attempts to vote
    Then the system should display message A
    And indicate that voting is not allowed

  Scenario: Request Results of Closed Ballot with Votes
    Given the ballot is closed
    And votes have been recorded
    When a user requests the results
    Then the system should present the results with candidate names, vote counts, and percentages

  Scenario: Request Results from Non-Closed Ballot
    Given the ballot is open
    When a user requests the results
    Then the system should display message B
    And indicate that results can only be requested from closed ballots

  Scenario: No Votes Recorded in Closed Ballot
    Given the ballot is closed
    And no votes have been recorded
    When the user requests results
    Then the system should display message C
    And communicate that no results are available

  Scenario: Second Round of Voting Initiated
    Given the ballot is closed
    And no candidate has received more than 50% of the votes
    When the system initiates the second round of voting
    Then the system should limit voting to the top candidates
    And determine the winner based on vote counts

  Scenario: Resolve Tie in Second Round of Voting
    Given a tie occurred in the second round of voting
    When the system checks the registration dates of the tied candidates
    Then the system should declare the winner based on the earliest registration date
    And display message D with the winner's name and vote count

  Scenario: Unresolvable Tie Due to Equal Registration Dates
    Given a tie occurred in the second round and candidates have equal registration dates
    When the system attempts to resolve the tie
    Then the system should display message E
    And indicate that the tie could not be resolved due to equal registration dates

  Scenario: Request Results from a Closed Ballot
    Given the ballot is closed
    And no votes have been recorded
    When a user attempts to request the results
    Then the system should display message C
    And indicate that no results are available
