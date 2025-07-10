Feature: Enable Candidates to Compete Again

  As a voting system administrator
  I want to ensure a fair voting process that allows for a second round if necessary
  So that I can confidently declare the winner based on majority votes

  Background:
    Given the first round of voting has been completed
    And no candidate has received over 50% of the total votes

  Scenario: Second Round Voting Initiated
    Given the candidate list includes those with the highest votes from the first round
    When there are candidates who received the highest votes and potential ties exist
    Then candidates are sorted by registration dates for a tie-break
    And the second round of voting commences

  Scenario: Voting in a Closed Ballot
    Given a user attempts to vote
    And the ballot is closed
    When the ballot is closed
    Then an error message is displayed indicating that voting is not permitted in a closed ballot

  Scenario: Viewing Results of a Non-Closed Ballot
    Given a user tries to view voting results
    And the ballot is open
    When the ballot is not closed
    Then an error message is shown stating results can only be obtained from closed ballots

  Scenario: No Votes Recorded
    Given there have been no recorded votes in a ballot
    When the user requests to see the results
    Then a message stating there are no results to show is displayed

  Scenario: Declaring the Winner After Second Round
    Given the second round of voting has concluded
    When a single candidate has achieved a majority of votes
    Then that candidate is declared the winner
    And all results, including names, vote counts, and percentages, are presented

  Scenario: Tie in Second Round Voting
    Given the second round ends with a tie
    When tie-breaking rules are applied based on registration dates
    Then the candidate with the earliest registration date is declared the winner

  Scenario: Action Taken When Votes Do Not Yield Majority
    Given the first round of voting does not yield a candidate with over 50% of the total votes
    When there have been multiple candidates with the highest votes
    Then a second round of voting is initiated with the highest candidates displayed
