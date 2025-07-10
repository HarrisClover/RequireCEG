Feature: Election Candidate Registration and Voting Process
  As an election administrator,
  I want to register candidates, record votes, and manage ballots (open/closed),
  So that the system can correctly tally votes, handle ties, and declare valid winners with proper error handling.

  # Scenario: Candidate Registration with Unique Attributes
  Scenario: Register a candidate with a unique identifier, name, and registration date
    Given a candidate is not already registered with identifier "CAND-001"
    When a user registers a candidate with identifier "CAND-001", name "Alice", and registration date "2025-04-01"
    Then the candidate is successfully created with the provided details

  # Scenario: Register multiple candidates
  Scenario: Register multiple candidates in the same election
    Given no candidates have been registered for the election
    When a user registers the following candidates:
      | Identifier | Name    | Registration Date |
      | CAND-001   | Alice   | 2025-04-01        |
      | CAND-002   | Bob     | 2025-04-02        |
    Then both candidates are registered with their unique identifiers and details

  # Scenario: Voting on an Open Ballot
  Scenario: Vote on an open ballot increments the candidate's vote count
    Given the ballot is open
    And candidate "CAND-001" is registered with name "Alice"
    When a user votes for candidate "CAND-001"
    Then candidate "CAND-001" vote count increases by 1
    And the ballot remains open

  # Scenario: Preventing votes on a Closed Ballot
  Scenario: Attempt to vote when the ballot is closed
    Given the ballot is closed
    And candidate "CAND-001" is already registered
    When a user attempts to vote for candidate "CAND-001"
    Then the system displays an error message "Vote not recorded: ballot is closed"

  # Scenario: Displaying Results for a Closed Ballot
  Scenario: Retrieve vote results after ballot closure
    Given the ballot is closed
    And the following votes have been cast:
      | Candidate | Vote Count |
      | CAND-001  | 30         |
      | CAND-002  | 20         |
    When a user requests the election results
    Then the system shows the results including vote counts and vote percentages for each candidate

  # Scenario: Handling Insufficient Majority - Initiating Second Round
  Scenario: No candidate receives over 50% and the system requires a second round
    Given the ballot is closed with the following vote counts:
      | Candidate | Vote Count |
      | CAND-001  | 45         |
      | CAND-002  | 40         |
    When the system computes the vote percentages
    Then the system indicates that no candidate received over 50% of the votes
    And instructs that a second round of voting is required

  # Scenario: Tie Resolution Based on Registration Date
  Scenario: Resolve tie based on candidate registration dates
    Given the ballot is closed with equal vote counts for two candidates:
      | Candidate | Vote Count | Registration Date |
      | CAND-001  | 40         | 2025-04-01        |
      | CAND-002  | 40         | 2025-04-02        |
    When the system calculates the winner
    Then candidate "CAND-001" is declared the winner based on an earlier registration date

  # Scenario: Second Round Voting Procedure
  Scenario: Conduct second round voting to determine a winner
    Given a second round ballot is open with candidates "CAND-001" and "CAND-002"
    When votes are cast for the candidates in the second round
    And the ballot is closed after the voting period
    Then the system tallies the votes from the second round
    And declares the candidate with the higher vote count as the winner
    And applies the tie-breaker rule based on registration date if needed

  # Scenario: Requesting Results from an Incomplete Ballot
  Scenario: Prevent result retrieval from a ballot that is still open
    Given the ballot is still open
    When a user requests the election results
    Then the system displays an error message "Results cannot be provided: ballot is still open"

  # Scenario: Handling No Votes Recorded
  Scenario: Attempt to retrieve results when no votes have been recorded
    Given the ballot is closed
    And candidates have been registered but no votes have been cast
    When a user requests the election results
    Then the system displays an error message "No votes have been recorded"
