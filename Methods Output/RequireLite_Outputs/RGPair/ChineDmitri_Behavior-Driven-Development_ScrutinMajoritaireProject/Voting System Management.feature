Feature: Voting System Management

  As a voter
  I want to cast my vote for candidates
  So that I can participate in the election process

  Background:
    Given the voting system is initialized with candidates
    And a user is logged in

  Scenario: Create a Candidate
    Given a candidate with unique identifier 'C001' and name 'John Doe'
    When the user registers the candidate
    Then the candidate should be added to the system
    And if a candidate with the same identifier or name already exists, an error message should be displayed

  Scenario: Vote for a Candidate
    Given a candidate 'John Doe' has been registered
    When the user votes for 'John Doe'
    Then 'John Doe's' vote count should increase by one
    And if the user attempts to vote for a candidate that does not exist or if the ballot is closed, an error message should be displayed

  Scenario: Check Ballot Status
    Given the ballot is open
    When the user checks the ballot status
    Then the ballot should be shown as open
    And if the ballot is closed, an appropriate message should be displayed indicating that voting is no longer possible

  Scenario: Request Results from Closed Ballot
    Given a voting session has ended and the ballot is closed
    When the user requests the election results
    Then the system should display the results including vote counts and percentages
    And if results are not retrievable due to system issues, an error message should be shown to the user

  Scenario: Second Round of Voting Requirement
    Given the first round of voting is complete with no candidate receiving over 50% of the votes
    When the user checks if a second round is required
    Then the system should confirm a second round of voting is necessary
    And the system should notify the users about the second round and its details clearly

  Scenario Outline: Handle Tie Scenario
    Given multiple candidates have the same highest vote count
    When the user checks the election results
    Then the system should declare the winner based on the earliest registration date
    And the candidates have distinct registration dates
    Examples:

