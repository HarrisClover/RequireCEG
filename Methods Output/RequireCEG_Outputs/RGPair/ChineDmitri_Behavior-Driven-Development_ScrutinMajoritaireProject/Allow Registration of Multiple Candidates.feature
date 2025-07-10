Feature: Allow Registration of Multiple Candidates

  As a system administrator
  I want to register unique candidates for elections
  So that voting can occur fairly and accurately

  Background:
    Given the candidate registration interface is accessible
    And the unique identifier format is validated

  Scenario: Successful Candidate Registration
    Given a unique candidate identifier is provided
    And the candidate's name is entered
    When the candidate details are submitted
    Then the candidate should be registered successfully
    And the registration date should be recorded

  Scenario: Duplicate Identifier Registration
    Given a duplicate candidate identifier is provided
    When the candidate details are submitted
    Then the system should display an error message
    And the message should state 'The identifier must be unique.'

  Scenario: Retrieve Registered Candidates
    Given multiple candidates have been registered
    When a request for candidate details is made
    Then the system should return a list of registered candidates

  Scenario: Vote for Registered Candidate during Open Ballot
    Given a candidate is registered
    And the ballot is open
    When a user votes for the registered candidate
    Then the vote count for that candidate should increment by one

  Scenario: Vote Attempt After Ballot Closure
    Given the ballot has closed
    When a user attempts to vote for a candidate
    Then the system should display an error message
    And the message should state 'Voting is not allowed in a closed ballot.'

  Scenario: No Candidate Achieves Majority
    Given the voting session has concluded
    And no candidate has over 50% of the votes
    When the results are evaluated
    Then the system should prepare for a second round of elections

  Scenario: Tie Between Candidates
    Given two or more candidates have equal votes
    When the votes are tallied
    Then the system should determine the winner
    And the candidate registered first should be declared the winner

  Scenario: Request Results During Open Ballot
    Given the ballot is still open
    When results are requested
    Then the system should indicate that results cannot be fetched at this time

  Scenario: Request Results with No Votes Cast
    Given no votes have been cast
    When results are requested
    Then the system should indicate that results cannot be fetched at this time

  Scenario: Voting Attempt with Closed Ballot
    Given voting is attempted after the ballot has closed
    When the user tries to cast a vote
    Then the system should display an error message
    And the message should state 'Voting is not allowed in a closed ballot.'
