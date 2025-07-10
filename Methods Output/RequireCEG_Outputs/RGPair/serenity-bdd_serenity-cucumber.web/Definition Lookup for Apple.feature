Feature: Definition Lookup for 'Apple'

  As a user
  I want to retrieve the accurate definition of 'apple'
  So that I can gain knowledge about the term quickly

  Background:
    Given the system is online
    And the definition of 'apple' is available

  Scenario: Scenario 1: Valid Term Search
    Given the user enters the term 'apple' into the definition lookup field
    When the user submits the search
    Then the system retrieves and displays the accurate definition of 'apple'
    And the definition should be accurate

  Scenario: Scenario 2: Invalid Term Search
    Given the user enters an invalid term into the definition lookup field
    When the user submits the search
    Then the system displays a message indicating that no definition was found

  Scenario: Scenario 3: No Term Provided
    Given the user leaves the definition lookup field empty
    When the user submits the search
    Then the system displays a message indicating that no definition was found

  Scenario: Scenario 4: Offline Access
    Given the user is offline
    When the user attempts to access the definition of 'apple'
    Then the system informs the user that the service is unavailable due to lack of internet connection.

  Scenario: Scenario 5: Cached Definition Retrieval
    Given the definition of 'apple' is cached
    And the current time is within the cache validity period
    When the user enters the term 'apple' into the definition lookup field
    Then the system retrieves the definition from the cache
    And the definition is displayed quickly

  Scenario Outline: Scenario Outline: Cached Definition Retrieval
    Given the definition of 'apple' is cached
    And the current time is within the cache validity period
    When the user enters the term 'apple' into the definition lookup field
    Then the system should retrieve the definition from the <cache status>
    Examples:
      | term | cache status | expected outcome |
      | apple | valid | definition retrieved from cache |
      | apple | expired | definition retrieved from source |

