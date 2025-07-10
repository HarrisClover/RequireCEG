Feature: Achievements and Badges

  As a player
  I want to earn badges and achievements for completing various wizarding milestones
  So that I can be rewarded and motivated to continue playing and exploring the game

  Background:
    Given the player has a profile in the system
    And the system is tracking player's progress and actions in real-time

  Scenario: Award 'Young Wizard' badge upon first successful spell
    Given the player has not yet earned the 'Young Wizard' badge
    When the player completes their first spell successfully
    Then the system shall award the 'Young Wizard' badge to the player's profile
    And duplicate awarding of the 'Young Wizard' badge shall be prevented

  Scenario: Award 'Treasurer' achievement on collecting wizarding coins
    Given the player has collected wizarding coins totaling 100 or more
    And the player has not yet earned the 'Treasurer' achievement
    When the system confirms the coin total is equal or greater than 100
    Then the system shall award the 'Treasurer' achievement to the player's profile
    And duplicate awarding of the 'Treasurer' achievement shall be prevented

  Scenario: Award 'Dueling Champion' badge immediately after winning a duel
    Given the player has not yet earned the 'Dueling Champion' badge
    When the player wins a duel against any challenging opponent
    Then the system shall immediately award the 'Dueling Champion' badge to the player's profile
    And duplicate awarding of the 'Dueling Champion' badge shall be prevented

  Scenario: Award 'House Hero' achievement after completing all four Hogwarts house challenges
    Given the player has completed all four Hogwarts house challenges
    And the player has not yet earned the 'House Hero' achievement
    When the system confirms completion of all challenges
    Then the system shall award the 'House Hero' achievement to the player's profile
    And duplicate awarding of the 'House Hero' achievement shall be prevented

  Scenario: Award 'Seeker of Secrets' badge when a hidden magical artifact is found
    Given the player has not yet earned the 'Seeker of Secrets' badge
    When the player finds a hidden magical artifact in the game world
    Then the system shall award the 'Seeker of Secrets' badge to the player's profile
    And duplicate awarding of the 'Seeker of Secrets' badge shall be prevented

  Scenario: Display congratulatory message upon earning three or more badges
    Given the system maintains a real-time count of badges earned by the player
    And the player has just earned their third (or more) badge
    When the badge count reaches or exceeds 3
    Then the system shall display a congratulatory message informing the player of unlocking a special Harry Potter themed reward or content

  Scenario: Ensure all awards and messages are delivered immediately upon achievement conditions met
    Given a player has achieved any badge or unlocked any message
    When an achievement condition is satisfied
    Then the system shall deliver all corresponding awards and messages immediately

  Scenario: Enforce prevention of duplicate awarding of all badges and achievements
    Given the player has already earned a badge or achievement
    When the triggering condition for awarding the same badge or achievement occurs again
    Then the system shall prevent awarding any duplicate badges or achievements
