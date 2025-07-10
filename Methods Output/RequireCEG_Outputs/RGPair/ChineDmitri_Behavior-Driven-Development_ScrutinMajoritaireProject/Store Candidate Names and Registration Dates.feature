Feature: Store Candidate Names and Registration Dates

  As a user of the voting system
  I want to register candidates with unique identifiers
  So that the integrity of the voting process is maintained

  Background:
    Given the system is ready for registration

  Scenario: Register a new candidate successfully
    Given the candidate's name is 'Alice' and the registration date is '2023-10-15'
    When the user registers the candidate
    Then the candidate is registered with a unique identifier
    And the system confirms the registration

  Scenario: Fail to register candidate with a duplicate name
    Given the candidate's name is 'Alice' and the registration date is '2023-10-16'
    When the user attempts to register the candidate
    Then the system displays an error message
    And the identifier must be unique

  Scenario: Vote casting during an open ballot
    Given the ballot is open
    When a user casts a vote for the candidate 'Alice'
    Then the vote is recorded
    And the total votes count is updated

  Scenario: Vote casting when the ballot is closed
    Given the ballot is closed
    When a user attempts to cast a vote
    Then the system informs the user that results cannot be retrieved from a non-closed ballot
    And the current results are displayed

  Scenario: Trigger second round of voting with no candidate over 50%
    Given no candidate received over 50% of the votes in the first round
    When the system identifies the top candidates
    Then a second round of voting is triggered
    And the system displays the names of top candidates

  Scenario: Resolve tie by registration date in second round
    Given there is a tie between candidates 'Alice' and 'Bob'
    When the system compares their registration dates
    Then the candidate with the earliest registration date is declared the winner

  Scenario: Retrieve results from non-closed ballot
    Given the ballot is still open
    When the user attempts to retrieve results
    Then the system responds with an appropriate error message

  Scenario: Display error for votes not recorded
    Given the ballot is closed
    When the user attempts to retrieve results with no votes recorded
    Then the system displays an error message indicating that no votes have been recorded

  Scenario Outline: Register candidates with various details
    Given the candidate's name is <name> and registration date is <registration-date>
    When the user registers the candidate
    Then the candidate is registered with <result>
    Examples:
      | name | registration-date | result |
      | Charlie | 2023-10-14 | a unique identifier |
      | Dave | 2023-10-15 | a unique identifier |
      | Alice | 2023-10-15 | an error message for duplicate |

