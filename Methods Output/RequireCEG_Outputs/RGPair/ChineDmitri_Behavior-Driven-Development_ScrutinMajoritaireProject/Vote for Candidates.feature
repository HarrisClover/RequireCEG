Feature: Vote for Candidates

  As a voter
  I want to cast my vote for my preferred candidate
  So that my choice is counted in the election

  Background:
    Given the ballot is open
    And there are candidates available for voting

  Scenario: Voting in an open ballot
    Given a voter is logged into the system
    When the voter selects a candidate and submits their vote
    Then the vote count for that candidate should be incremented

  Scenario: Attempting to vote in a closed ballot
    Given the ballot is closed
    When the voter tries to cast their vote
    Then an error message 'Voting is not allowed in a closed ballot' should be displayed

  Scenario: Checking results in an open ballot
    Given the ballot is open
    When the voter requests to see the election results
    Then a message indicating that results can only be obtained from a closed ballot should be returned

  Scenario: Checking results with no votes
    Given the ballot has closed
    And no votes have been recorded
    When the voter requests to see the election results
    Then a message stating that results cannot be generated due to lack of votes should be displayed

  Scenario: Determining the winner with a majority
    Given the ballot is closed
    And a candidate receives over 50% of the total votes
    When the votes are tallied
    Then the candidate with the majority should be declared the winner

  Scenario: Initiating a second round of voting
    Given the ballot is closed
    And no candidate receives more than 50% of the votes
    When the votes are tallied
    Then a second round of voting should be initiated among the candidates with the highest vote counts

  Scenario: Handling a tie among candidates
    Given the ballot is closed
    And there is a tie between candidates based on votes
    When the candidates are compared based on their registration dates
    Then the candidate who registered first should be declared the winner

  Scenario: Requesting results from an incomplete ballot
    Given the ballot is not closed
    When the voter requests to see the results
    Then an error message detailing the issue should be provided

  Scenario: Attempting to check results during the open ballot
    Given the ballot is open
    When the voter attempts to check the election results
    Then a message indicating that results can only be obtained from a closed ballot should be returned

  Scenario: Voting when no votes have been recorded
    Given the ballot is closed
    And no votes have been recorded for any candidate
    When the votes are tallied
    Then the results cannot be generated due to the lack of votes
