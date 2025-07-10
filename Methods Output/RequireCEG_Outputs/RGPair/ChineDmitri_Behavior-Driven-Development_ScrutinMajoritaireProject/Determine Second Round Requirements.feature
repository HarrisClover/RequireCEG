Feature: Voting System with Second Round Regulation

  As a system administrator
  I want to manage voting rounds and handle closed ballot scenarios
  So that I can ensure fair voting procedures and improve user experience

  Background:
    Given that voting is in progress
    And the number of votes cast is known

  Scenario: First Voting Round with No Majority
    Given that no candidate has received over 50% of the votes in the first round
    When the system checks voting results
    Then the system will initiate a second round of voting
    And notify participants of the new voting period

  Scenario: Voting Attempt During Closed Ballot
    Given that the ballot is closed
    When a user attempts to vote
    Then the system displays 'Voting is not allowed in a closed ballot.'

  Scenario: Requesting Results from Non-Closed Ballot
    Given that the ballot is still open
    When a user tries to request the voting results
    Then the system responds with 'Results cannot be retrieved until the ballot is closed.'

  Scenario: Handling Ties After Second Voting Round
    Given that a tie occurs after the second round of voting
    When the system evaluates the candidates
    Then the system declares a winner based on the earliest registration date of the tied candidates

  Scenario: Displaying Vote Counts and Percentages
    Given that no candidate has received over 50% of the votes in the first round
    When the system presents the vote counts
    Then the system presents the vote counts and percentages clearly
