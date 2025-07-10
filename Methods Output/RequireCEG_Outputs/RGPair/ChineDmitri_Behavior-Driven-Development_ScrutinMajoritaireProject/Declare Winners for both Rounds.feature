Feature: Declare Winners for both Rounds

  As a voting system administrator
  I want to manage voting and declare winners based on received votes
  So that the voting process is fair and transparent

  Background:
    Given the voting system is initialized
    And candidates have registered for the voting

  Scenario: First round voting with a clear winner
    Given the candidates receive votes that total more than 50%
    When the votes are tallied
    Then the candidate with over 50% of the votes is declared the winner

  Scenario: First round voting with a tie
    Given two candidates receive the same highest number of votes
    When the votes are tallied
    Then the winner is determined based on the earliest registration date

  Scenario: Second round voting with a clear winner
    Given there was no winner in the first round
    When the votes are tallied for the remaining candidates
    Then the candidate who secures more than 50% of the votes is declared the winner

  Scenario: Second round voting with a tie
    Given two candidates tie after the second round of voting
    When the votes are tallied
    Then the winner is determined based on the registration dates

  Scenario: Results requested from an open ballot
    Given the ballot is open
    When a user requests the results
    Then an error message is displayed stating 'Results can only be requested from closed ballots.'

  Scenario: No votes cast
    Given no votes have been recorded
    When the system checks the ballot
    Then the message 'No votes have been cast.' is displayed

  Scenario: Voting during a closed ballot
    Given the ballot is closed
    When a user attempts to vote
    Then an error message is displayed indicating 'Voting is not allowed in a closed ballot.'

  Scenario: Requesting results without a closed ballot
    Given the ballot is open
    When a user attempts to request voting results
    Then the message 'Results can only be requested from closed ballots.' is displayed

  Scenario: No votes recorded
    Given there are no votes recorded
    When the system checks the ballot
    Then the message 'No votes have been cast.' is displayed
