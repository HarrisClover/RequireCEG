Feature: Increment Vote Counts

  As a voter
  I want to cast my vote for a candidate
  So that my preference is counted in the election

  Background:
    Given the ballot is currently open
    And there is a list of eligible candidates

  Scenario: Voting for an existing candidate
    Given the ballot is open
    And the candidate 'Alice' is on the list of eligible candidates
    When I cast my vote for 'Alice'
    Then the vote count for 'Alice' should be incremented by one
    And a confirmation message should be displayed

  Scenario: Attempting to vote when the ballot is closed
    Given the ballot is closed
    When I attempt to vote for 'Alice'
    Then an error message should inform me that voting is not permitted

  Scenario: Voting for a non-existent candidate
    Given the ballot is open
    When I cast my vote for 'Bob'
    Then an error message should inform me that 'Bob' is not a valid candidate

  Scenario: Checking results while ballot is open
    Given the ballot is open
    When I request to see the results
    Then a message should notify me that results can only be accessed upon closure of the ballot

  Scenario: Second round of voting triggered
    Given the ballot has closed and no candidate has more than 50% of the votes
    When the results are tallied
    Then a notification should inform users about a second round of voting

  Scenario: Resolving a tie between candidates
    Given the ballot has closed and there is a tie
    When the candidates 'Alice' and 'Charlie' both have the same vote count
    Then the candidate with the earliest registration date should be declared the winner

  Scenario: No votes were recorded
    Given the ballot has closed with no votes cast
    When the results are requested
    Then the system should alert that results cannot be generated

  Scenario: User attempts to check results while ballot is open
    Given the ballot is open
    When I check the results
    Then a notification should inform me that results can only be accessed when the ballot is closed

  Scenario: User attempts to vote when the ballot is closed
    Given the ballot is closed
    When I try to vote
    Then the system should display an error message stating that voting is not permitted
