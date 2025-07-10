Feature: Explore Iconic Locations (Hogwarts, Diagonally Alley, Forbidden Forest)

  As a game player
  I want to choose from iconic locations with environment-specific challenges and benefits
  So that I can experience diverse gameplay with quests, interactions, and resource management tailored to each location

  Background:
    Given the player has started a new game
    And the player can select a location to explore

  Scenario: Load Hogwarts environment with magical quests
    Given the player chooses Hogwarts as the location
    When the game environment loads
    Then the castle setting is presented
    And quests focused on magical classes and interactions with professors and students are available

  Scenario: Access shops in Diagon Alley
    Given the player chooses Diagon Alley as the location
    When the game environment loads
    Then shops are accessible where the player can purchase wands, potion ingredients, and other magical items

  Scenario: Engage in challenges in the Forbidden Forest
    Given the player chooses the Forbidden Forest as the location
    When the game environment loads
    Then the player faces challenges involving magical creatures and hidden secrets specific to the environment

  Scenario: Unlock special items in Hogwarts after completing quests in Diagon Alley
    Given the player enters Hogwarts
    And the player has completed at least one quest in Diagon Alley
    When the player begins exploration in Hogwarts
    Then special items obtained or unlocked in Diagon Alley become available for use within Hogwarts

  Scenario: Increase difficulty and restrict resources in Forbidden Forest without proper preparation
    Given the player enters the Forbidden Forest
    And the player has not acquired proper preparation for the Forbidden Forest
    When the player starts encounters in the Forbidden Forest
    Then the difficulty of encounters in the Forbidden Forest is increased
    And available resources in the Forbidden Forest are restricted

  Scenario: Standard difficulty and full resources in Forbidden Forest with proper preparation
    Given the player enters the Forbidden Forest
    And the player has acquired proper preparation for the Forbidden Forest
    When the player starts encounters in the Forbidden Forest
    Then encounter difficulty is standard
    And full resources are available in the Forbidden Forest

  Scenario Outline: Adjust Forbidden Forest difficulty based on preparation
    Given the player enters the Forbidden Forest
    And preparation status is <preparation-status>
    When the player starts encounters in the Forbidden Forest
    Then <difficulty-outcome>
    And <resource-availability>
    Examples:
      | preparation-status | difficulty-outcome | resource-availability |
      | has completed requisite quests or purchased necessary items in Diagon Alley | encounter difficulty is standard | full resources are available |
      | has not completed requisite quests or purchased necessary items in Diagon Alley | encounter difficulty is increased | resources are restricted |

