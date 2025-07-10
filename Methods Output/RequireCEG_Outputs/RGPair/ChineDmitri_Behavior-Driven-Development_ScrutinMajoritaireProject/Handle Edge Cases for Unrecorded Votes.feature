Feature: Handle Edge Cases for Unrecorded Votes

  As a system user
  I want to retrieve ballot results efficiently
  So that I can understand the outcome of the voting process

  Background:
    Given a ballot exists
    And the user is authenticated

  Scenario: Scenario 1: Ballot is still open
    Given the ballot status is open
    When the user requests results
    Then the system should display 'Results cannot be retrieved as the ballot is still open.'

  Scenario: Scenario 2: Ballot is closed but no votes recorded
    Given the ballot status is closed
    And no votes have been recorded
    When the user requests results
    Then the system should display 'No votes have been recorded; results are not available.'

  Scenario: Scenario 3: Ballot is closed with recorded votes
    Given the ballot status is closed
    And votes have been recorded
    When the user requests results
    Then the system should calculate and display the results including the vote counts and percentages for each candidate.

  Scenario: Scenario 4: Tie in votes
    Given the ballot has been closed
    And there is a tie in vote counts for candidates
    When the user requests results
    Then the system should display 'The candidate with the earliest registration date wins the tie.'

  Scenario: Scenario 5: No candidate achieves over 50% after the first round
    Given the total votes have been counted
    And no candidate has achieved over 50% of the total votes
    When the user requests results
    Then the system should enable a second round of voting while ensuring each candidate retains their unique identifiers.

  Scenario: Scenario 6: Ballot is closed, but no votes have been recorded inconsistently
    Given the ballot is closed
    And no votes have been recorded
    When the user tries to access results without proper verification
    Then the system should not allow access to results
