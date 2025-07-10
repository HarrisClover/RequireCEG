Feature: House Competitions and Rankings

  As a school system administrator
  I want to record player outcomes in House competitions and update House points and rankings
  So that the Houses can be ranked fairly and promoted, and special messages can be triggered for top Houses

  Background:
    Given there are multiple Houses with initial points
    And players belong to Houses and participate in competitions

  Scenario: Record player participation and competition outcome
    Given a player participates in a House competition
    When the player's participation and outcome are recorded
    Then the system records the player's House affiliation and competition outcome

  Scenario: Award points for winning player and recalculate House points
    Given a player participates in a House competition
    When the player wins the competition
    Then the system awards 10 points to the player's House
    And the system recalculates the House's total points

  Scenario: Award points for second place player and recalculate House points
    Given a player participates in a House competition
    When the player places second in the competition
    Then the system awards 5 points to the player's House
    And the system recalculates the House's total points

  Scenario: No points awarded for players placing third or lower and recalculate House points
    Given a player participates in a House competition
    When the player places third or lower in the competition
    Then the system awards no points to the player's House
    And the system recalculates the House's total points

  Scenario: Award points and update rankings for multiple players from different Houses
    Given multiple players from different Houses participate in the competition
    When each player's competition outcome is recorded
    Then the system updates each House's points based on each player's outcome
    And the system recalculates total points for each House
    And the system updates the ranking order of Houses accordingly

  Scenario: Mark House as advancing when points exceed 50
    Given a House has accumulated points greater than 50 after a competition
    When points are updated after the competition
    Then the system marks the House as advancing in the ranking

  Scenario: Trigger special congratulatory message for House ranked first
    Given House rankings have been updated after a competition
    When a House reaches the first rank
    Then the system triggers a special congratulatory message for that House

  Scenario: Refresh and present updated rankings and messages after competition
    Given a player participates in a House competition
    When the competition concludes and points are updated
    Then the system refreshes and presents updated rankings and messages after every competition

  Scenario Outline: Award points and update rankings for multiple player outcomes
    Given a competition with players from Houses
    And player <player-name> from House <house-name> places <placement>
    When the competition outcomes are recorded
    Then the system awards <points> points to <house-name>
    And the system recalculates the total points and rankings
    And if the House total points > 50 the House is marked as advancing
    And if the House ranks first a congratulatory message is triggered
    Examples:
      | player-name | house-name | placement | points |
      | Alice | Red House | first | 10 |
      | Bob | Blue House | second | 5 |
      | Charlie | Green House | third | 0 |
      | Diana | Red House | second | 5 |
      | Evan | Blue House | fourth | 0 |

