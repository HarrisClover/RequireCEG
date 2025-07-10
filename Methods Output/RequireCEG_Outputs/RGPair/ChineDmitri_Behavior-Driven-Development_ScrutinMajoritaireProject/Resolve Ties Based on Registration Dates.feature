Feature: Resolve Ties Based on Registration Dates

  As a voting system administrator
  I want to resolve ties based on candidate registration dates
  So that the election results can be finalized fairly

  Background:
    Given the ballot is closed
    And there are recorded votes

  Scenario: Scenario 1: Both candidates have distinct registration dates
    Given Candidate A is registered on 2023-01-10
    And Candidate B is registered on 2023-02-15
    When the votes are tallied
    Then Candidate A is declared the winner
    And a message confirming Candidate A's victory is displayed

  Scenario: Scenario 2: Tie due to identical votes and registration dates
    Given Candidate A is registered on 2023-01-10
    And Candidate B is also registered on 2023-01-10
    When the votes are tallied and result in a tie
    Then the tie cannot be resolved due to identical registration dates

  Scenario: Scenario 3: Candidate B has earlier registration date in a tie situation
    Given Candidate A is registered on 2023-03-01
    And Candidate B is registered on 2023-02-20
    When the votes are tallied and result in a tie
    Then Candidate B is declared the winner
    And a message confirming Candidate B's victory is displayed

  Scenario: Scenario 4: Open ballot situation
    Given the ballot is still open
    And there are no votes recorded
    When attempting to access the results
    Then an error message indicating the inability to access results is displayed

  Scenario Outline: Scenario Outline: Access results when ballot is open
    Given the ballot is <ballotStatus>
    And there are <votesRecorded>
    When attempting to access the results
    Then <outcome>
    Examples:
      | ballotStatus | votesRecorded | outcome |
      | Open | No | Error: Unable to access results. |
      | Open | Yes | Error: Unable to access results. |
      | Closed | No | Error: Unable to access results. |

