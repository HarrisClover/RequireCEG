Feature: Calculate Vote Counts and Percentages

  As a voter
  I want to obtain the results of the voting
  So that I can see the outcome of the election

  Background:
    Given the ballot has been closed
    And votes have been recorded

  Scenario: Scenario 1: No votes recorded
    Given the ballot has been closed
    When a user requests the election results
    Then the system should return 'No results are available due to lack of votes.'

  Scenario: Scenario 2: Candidate receives more than 50% of votes
    Given the ballot has been closed
    And votes have been recorded with one candidate receiving 60% of the votes
    When a user requests the election results
    Then the system should declare that candidate as the winner and display the winning candidate's name and vote count

  Scenario: Scenario 3: No candidate surpasses 50%
    Given the ballot has been closed
    And votes have been recorded with multiple candidates receiving less than 50%
    When a user requests the election results
    Then the system should initiate a second round of voting with the candidates having the highest vote counts

  Scenario: Scenario 4: Tie occurs between candidates
    Given the ballot has been closed
    And two candidates are tied with equal vote counts
    When a user requests the election results
    Then the system should determine the winner based on the earliest registration date of the tied candidates

  Scenario: Scenario 5: Requesting results while ballot is open
    Given the ballot is still open
    When a user attempts to request the election results
    Then the system should display 'Results can only be requested from closed ballots.'

  Scenario: Scenario 6: Voting after the ballot is closed
    Given the ballot has been closed
    When a user tries to cast a vote
    Then the system should return the message 'Voting is no longer permitted.'

  Scenario: Scenario 7: Requesting results while the ballot is still open
    Given the ballot is still open
    When a user attempts to request the election results
    Then the system should display 'Results can only be requested from closed ballots.'

  Scenario: Scenario 8: No votes recorded with closed ballot
    Given the ballot has been closed
    And there are no votes recorded
    When a user requests the election results
    Then the system should return 'No results are available due to lack of votes.'
