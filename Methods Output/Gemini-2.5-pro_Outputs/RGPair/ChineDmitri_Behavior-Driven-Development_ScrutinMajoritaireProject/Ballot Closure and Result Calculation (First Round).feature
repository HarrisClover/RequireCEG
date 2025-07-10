Feature: Ballot Closure and Result Calculation (First Round)
  As an election administrator
  I want to close the ballot and view the results
  So that the outcome of the first round can be determined.

  Background:
    Given the following candidates are registered:
      | Identifier | Name            | Registration Date |
      | C1         | Alice Alison    | 2023-10-01        |
      | C2         | Bob Barker      | 2023-10-02        |
      | C3         | Charlie Chaplin | 2023-09-30        |

  Scenario Outline: Determining the winner or need for a second round
    Given the ballot is open
    And the following votes have been cast: <votes_cast>
    When the administrator closes the ballot
    And the administrator requests the election results
    Then the ballot status should be "Closed"
    And the results should show the following vote counts: <expected_counts>
    And the results should show the following vote percentages: <expected_percentages>
    And the outcome should be "<outcome>"

    Examples: Candidate Votes and Outcomes
      | votes_cast                               | expected_counts        | expected_percentages | outcome                                     |
      | C1: 3, C2: 1, C3: 1                      | C1: 3, C2: 1, C3: 1    | C1: 60%, C2: 20%, C3: 20% | Winner is C1                                |
      | C1: 2, C2: 2, C3: 1                      | C1: 2, C2: 2, C3: 1    | C1: 40%, C2: 40%, C3: 20% | Second round required between C1 and C2     |
      | C1: 1, C2: 1, C3: 1                      | C1: 1, C2: 1, C3: 1    | C1: 33.3%, C2: 33.3%, C3: 33.3% | Second round required between C3, C1, and C2 | # Assuming top candidates proceed, tie-breaker ranks them

  Scenario: Requesting results when the ballot is still open
    Given the ballot is open
    And votes have been cast
    When the administrator requests the election results
    Then the system should provide an error message indicating "Ballot is not closed"
    And no results should be displayed

  Scenario: Requesting results when no votes have been cast
    Given the ballot is open
    And no votes have been cast
    When the administrator closes the ballot
    And the administrator requests the election results
    Then the ballot status should be "Closed"
    And the results should indicate "No votes were recorded"
    And the outcome should be "No votes cast"

