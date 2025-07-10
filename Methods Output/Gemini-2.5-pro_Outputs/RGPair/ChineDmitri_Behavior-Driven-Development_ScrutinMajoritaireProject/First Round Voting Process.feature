Feature: First Round Voting Process
  As a voter
  I want to cast my vote for a registered candidate
  So that my preference is recorded while the ballot is open.

  Background:
    Given the following candidates are registered:
      | Identifier | Name          | Registration Date |
      | C1         | Alice Alison  | 2023-10-01        |
      | C2         | Bob Barker    | 2023-10-02        |
    And the ballot is open for voting

  Scenario: Casting a vote for a candidate
    When a voter casts a vote for candidate "C1"
    Then the vote count for candidate "C1" should be 1
    And the vote count for candidate "C2" should be 0

  Scenario: Casting multiple votes for different candidates
    When a voter casts a vote for candidate "C1"
    And another voter casts a vote for candidate "C2"
    And another voter casts a vote for candidate "C1"
    Then the vote count for candidate "C1" should be 2
    And the vote count for candidate "C2" should be 1

  Scenario: Attempting to vote when the ballot is closed
    Given the ballot is closed
    When a voter attempts to cast a vote for candidate "C1"
    Then the vote should be rejected
    And the system should provide an error message indicating "Voting is closed"
    And the vote count for candidate "C1" should remain unchanged

