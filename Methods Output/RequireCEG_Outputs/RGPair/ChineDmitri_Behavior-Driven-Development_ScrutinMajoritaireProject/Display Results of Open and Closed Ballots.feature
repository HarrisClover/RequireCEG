Feature: Display Results of Open and Closed Ballots

  As a system administrator
  I want to display election results and handle ballot statuses
  So that users can understand the voting outcome and proceed accordingly

  Background:
    Given that a ballot has been created
    And that candidates have been registered for the election

  Scenario: Display results for a closed ballot with votes
    Given the ballot is closed
    And votes have been recorded
    When the request to display results is made
    Then the vote counts for each candidate should be displayed
    And the vote percentages should be calculated and shown

  Scenario: Display results for a closed ballot with no votes
    Given the ballot is closed
    And no votes have been recorded
    When the request to display results is made
    Then a message should state that there are no results to show

  Scenario: Attempt to display results of an open ballot
    Given the ballot is open
    When the request to display results is made
    Then a message should indicate that results cannot be retrieved until the ballot is closed

  Scenario: Winning candidate determination in a tie
    Given the ballot is closed
    And candidates are tied with equal vote counts
    When the system calculates the winner
    Then the candidate who registered first should be declared the winner

  Scenario: Initiate second round of voting
    Given the ballot is closed
    And no candidate has secured over 50% of the votes
    When the result is processed
    Then a second round of voting should be initiated

  Scenario: Attempt to vote after the ballot is closed
    Given the ballot is closed
    When a user attempts to cast a vote
    Then an error message should be displayed stating that voting is not allowed

  Scenario: Winning candidate determination when no votes are recorded
    Given the ballot is closed
    And no votes have been recorded
    When the system checks for a winner
    Then the system should confirm that no candidates can be declared as winners
