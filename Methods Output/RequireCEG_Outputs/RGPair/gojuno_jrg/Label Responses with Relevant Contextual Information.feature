Feature: Label Responses with Relevant Contextual Information

  As a service provider
  I want to validate input coordinates and provide relevant feedback
  So that customers receive accurate location information and support

  Background:
    Given the system is prepared to accept coordinates
    And the established service areas are defined

  Scenario: Scenario 1: Valid Numeric Coordinates Within Service Area
    Given a customer provides valid numeric coordinates
    When the system validates the coordinates
    Then the system returns the corresponding address
    And the response indicates the service is available

  Scenario: Scenario 2: Invalid Non-Numeric Coordinates
    Given a customer provides non-numeric coordinates
    When the system checks the coordinates
    Then the system returns 'Invalid input: please provide numeric coordinates.'

  Scenario: Scenario 3: Coordinates Outside Service Area
    Given a customer provides numeric coordinates that are outside the service area
    When the system evaluates the coordinates
    Then the system returns 'Coordinates outside service area.'

  Scenario: Scenario 4: Ambiguous Location
    Given a customer provides coordinates with multiple potential matches
    When the system identifies potential locations
    Then the system returns 'Ambiguous location: closest match provided.'

  Scenario: Scenario 5: Building Identified
    Given a customer provides coordinates for a building without a traditional address
    When the system processes the coordinates
    Then the system returns the building's name with the label 'Building identified.'

  Scenario: Scenario 6: High Load Handling
    Given the number of incoming requests is approaching the threshold
    When the system processes the requests
    Then the system returns 'High load: response may be delayed.'

  Scenario: Scenario 7: Administrative Data Takes Precedence
    Given a customer includes administrative data with the coordinates
    When the system processes the input
    Then the system prioritizes the administrative data in the response

  Scenario Outline: Scenario Outline: Handling High Load
    Given the number of incoming requests is <request volume>
    When the system processes the requests
    Then the system returns 'High load: response may be delayed.'
    Examples:
      | request volume | response label |
      | 100 | High load: response may be delayed. |
      | 150 | High load: response may be delayed. |
      | 200 | High load: response may be delayed. |

