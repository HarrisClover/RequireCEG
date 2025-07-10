Feature: Identify Winners Based on Total Votes

  As a ballot system administrator
  I want to determine the winner based on the total votes received by candidates
  So that I can accurately declare the winner and handle any necessary tie-breaking procedures

  Background:
    Given the ballot is closed
    And votes have been recorded for the candidates

  Scenario: Scenario 1: Candidate receives more than 50% of the votes
    Given the total number of votes is 100
    And Candidate A receives 60 votes
    When results are requested
    Then Candidate A is declared the winner
    And a confirmation message is displayed

  Scenario: Scenario 2: No candidate surpasses 50% threshold
    Given the total number of votes is 200
    And Candidate A receives 40 votes, Candidate B receives 50 votes, and Candidate C receives 110 votes
    When results are requested
    Then a second round of voting is initiated among Candidate B and Candidate C

  Scenario: Scenario 3: Handling ties in votes
    Given the total number of votes is 150
    And Candidate A receives 50 votes and Candidate B receives 50 votes
    When results are requested
    Then the system checks registration dates
    And the candidate with the earliest registration date is declared the winner

  Scenario: Scenario 4: No votes recorded
    Given there are no recorded votes
    When results are requested
    Then a message is displayed informing that there are no results to display

  Scenario: Scenario 5: Voting is closed
    Given the ballot is closed
    When a user attempts to vote
    Then an error message is presented stating that voting is closed and cannot be processed

  Scenario: Scenario 6: Requesting results while ballot is open
    Given the ballot is still open
    When a user requests the results
    Then an error message is displayed indicating that results can only be obtained from closed ballots

  Scenario: Scenario 7: No recorded votes at the time results are requested
    Given there are no recorded votes at the time results are requested
    When results are requested
    Then a message is displayed informing that there are no results to display

  Scenario: Scenario 8: User attempts to request results while the ballot is still open
    Given the ballot is still open
    When the user attempts to request results
    Then an error message is displayed indicating that results can only be obtained from closed ballots
