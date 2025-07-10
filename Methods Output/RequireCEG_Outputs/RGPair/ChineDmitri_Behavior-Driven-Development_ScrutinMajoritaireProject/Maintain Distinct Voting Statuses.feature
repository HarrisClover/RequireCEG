Feature: Maintain Distinct Voting Statuses

  As a voter
  I want to know if I can vote and receive results
  So that I can participate effectively in the election process

  Background:
    Given the ballot has been created
    And the voting period has been defined

  Scenario: Voting while the ballot is open
    Given the ballot status is open
    When a user attempts to vote
    Then the user's vote is recorded
    And the corresponding candidate's vote count is incremented

  Scenario: Attempting to vote when the ballot is closed
    Given the ballot status is closed
    When a user attempts to vote
    Then an error message is displayed
    And the message indicates that voting is not permitted

  Scenario: Inquiring about the ballot's status
    When a user asks for the ballot's status
    Then the system accurately reports whether it is open or closed

  Scenario: Requesting results from a closed ballot
    Given the ballot is closed with no recorded votes
    When a user requests the results
    Then the system informs the user that no results are available for the closed ballot

  Scenario: Requesting results from an open ballot
    Given the ballot status is open
    When a user requests the results
    Then an error message is displayed
    And the message specifies that results can only be accessed from closed ballots

  Scenario: Handling no majority in initial voting
    Given the voting process concludes without any candidate receiving over 50% of votes
    Then the system prepares for a second round of elections
    And the system checks for ties and resolves them by comparing registration dates

  Scenario: Declaring the winner in case of a tie
    Given there is a tie between candidates
    When the system evaluates the registration dates
    Then the candidate with the earlier registration date is declared the winner
    And a message of the election outcome is provided

  Scenario: User inquires about ballot status
    When a user inquires about the ballot's status
    Then the system reports the current ballot status (open/closed)

  Scenario: User inquiry and results availability
    Given the ballot is closed
    When a user inquires about election results
    Then the system informs the user that no results are available for the closed ballot
