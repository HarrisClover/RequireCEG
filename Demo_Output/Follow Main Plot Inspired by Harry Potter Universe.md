Feature: Follow Main Plot Inspired by Harry Potter Universe

  As a new player identified as a first-year student
  I want the game to initialize at the Hogwarts Express and provide an introductory tutorial on magical skills
  So that I can learn the basics and be prepared for the upcoming challenges at Hogwarts

  Background:
    Given the player is a first-year student
    And the player has just launched the game

  Scenario: Game Initialization for First-Year Students
    Given the player is identified as a first-year student
    When the game starts
    Then the game initializes at the Hogwarts Express
    And an introductory tutorial on basic magical skills is presented

  Scenario: House Assignment with Sorting Hat Event
    Given the player receives the Sorting Hat event
    And the player’s choices or quiz results are available for house evaluation
    When the system evaluates the player’s choices or quiz results
    Then the player is assigned to exactly one of the four Houses: Gryffindor, Hufflepuff, Ravenclaw, or Slytherin
    And a message confirming the assigned House is displayed
    And house-specific interactions are unlocked

  Scenario: Display House Assignment Confirmation Messages
    Given the player is assigned to Gryffindor
    When Gryffindor assignment occurs
    Then a message confirming the player's Gryffindor assignment is displayed

  Scenario: Display House Assignment Confirmation Messages
    Given the player is assigned to Hufflepuff
    When Hufflepuff assignment occurs
    Then a message confirming the player's Hufflepuff assignment is displayed

  Scenario: Display House Assignment Confirmation Messages
    Given the player is assigned to Ravenclaw
    When Ravenclaw assignment occurs
    Then a message confirming the player's Ravenclaw assignment is displayed

  Scenario: Display House Assignment Confirmation Messages
    Given the player is assigned to Slytherin
    When Slytherin assignment occurs
    Then a message confirming the player's Slytherin assignment is displayed

  Scenario: Attending Classes and Gaining Experience
    Given the player has been assigned to a House
    And the player attends classes
    When classes are attended
    Then experience points for the House are incremented
    And new spells are progressively unlocked
    And a notification of newly learned spells and updated experience total is shown

  Scenario: Participation in Quidditch Matches
    Given the player participates in a Quidditch match
    When the match ends
    Then house points related to the match are updated
    And the player’s flying skill levels are updated
    And a summary of points earned is presented

  Scenario: Advancing Key Storyline Through Mysteries and Puzzles
    Given the player discovers hidden mysteries or solves puzzles
    When progress is made on major Harry Potter plot points
    Then key storyline events such as uncovering the Philosopher's Stone or confronting magical creatures advance
    And progress bars and narrative text updates keep the player informed

  Scenario: Final Year Milestone and Final Confrontation
    Given the player reaches the final year milestone
    When the final confrontation event with Voldemort or dark forces is initiated
    Then decision trees influenced by accumulated house points, friendships, and inventory items are presented
    And appropriate plot paths and outcomes are made available based on player state

  Scenario: Dynamic Plot Adjustments Based on Player State
    Given the player has house points, friendships, and inventory items accumulated
    When the player makes choices or progresses
    Then the system dynamically adjusts available plot paths and displays contextual messages reflecting the changes

  Scenario: Handling Invalid Progression Attempts
    Given the player attempts actions that contradict expected progression (e.g., attending advanced classes before sorting)
    When such invalid input or action is detected
    Then appropriate error or guidance messages are shown
    And logical flow of the gameplay is maintained

  Scenario: Ensure Player is Assigned to Only One House
    Given the player is assigned to Houses Gryffindor, Hufflepuff, Ravenclaw, or Slytherin
    When house assignment is processed
    Then the player is assigned to exactly one House and no multiple house assignments occur
