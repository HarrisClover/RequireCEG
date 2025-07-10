Feature: Provide Error Messages for Invalid Actions

  As a user of the voting system
  I want to receive appropriate error messages for invalid actions
  So that I can understand the system's rules and limitations

  Background:
    Given that the ballot system is operational
    And that I have the required permissions to interact with the ballot

  Scenario: Scenario 1: Voting after ballot closure
    Given the ballot is closed
    When I attempt to cast a vote
    Then the system should display 'Voting is closed for this ballot. You cannot cast a vote.'

  Scenario: Scenario 2: Registering a candidate with a duplicate identifier
    Given I have a candidate identifier that already exists
    When I try to register the candidate
    Then the system should display 'Candidate identifier must be unique. Please choose another one.'

  Scenario: Scenario 3: Requesting results from a non-closed ballot
    Given the ballot is open
    When I request the results
    Then the system should display 'Results cannot be retrieved until the ballot is closed.'

  Scenario: Scenario 4: Checking results with no recorded votes
    Given no votes have been recorded
    When I check the ballot results
    Then the system should display 'No votes have been recorded for this ballot. Results are unavailable.'

  Scenario: Scenario 5: Initiating a second round of voting without a clear winner
    Given the first round of voting has concluded with no candidate achieving over 50% of the votes
    When I attempt to initiate a second round
    Then the system should display 'Second round of voting is initiated due to no clear winner. Please confirm candidates.'

  Scenario: Scenario 6: Handling a tie with shared registration dates
    Given there is a tie between candidates with the same registration date
    When I check for a winner
    Then the system should display 'A tie has occurred. The candidate registered earliest wins.'

  Scenario: Scenario 7: Requesting results while the ballot remains open
    Given the ballot is still open
    When I request the results
    Then the system should display 'You cannot request results from an open ballot. Please wait until it is closed.'

  Scenario: Scenario 8: Not able to request results from an open ballot
    Given the ballot is currently open
    When I make a request to view the results
    Then the system should not allow the request and should display 'You cannot request results from an open ballot. Please wait until it is closed.'

  Scenario: Scenario 9: Trying to access results from a non-closed ballot
    Given the ballot is open and votes are being recorded
    When I check for results
    Then the system should inform me that 'Results cannot be retrieved until the ballot is closed.'
