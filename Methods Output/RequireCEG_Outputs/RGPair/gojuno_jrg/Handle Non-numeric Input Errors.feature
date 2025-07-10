Feature: Handle Non-numeric Input Errors

  As a user of the system
  I want to ensure that geographic coordinates are validated properly
  So that I can input correct coordinates without errors

  Background:
    Given the system is ready to receive geographic coordinates
    And input validation rules are in place

  Scenario: Scenario 1: No Input Provided
    Given no geographic coordinates are inputted
    When the user submits the input
    Then the system should respond with 'No Input Provided: Please provide geographic coordinates.'
    And the status code should be 400

  Scenario: Scenario 2: Invalid Non-numeric Input
    Given the user inputs the coordinates 'abc,def'
    When the coordinates are submitted
    Then the system should respond with 'Invalid Input: Please enter valid numeric coordinates.'
    And the status code should be 400

  Scenario: Scenario 3: Incorrect Format of Input
    Given the user inputs the coordinates '123.45'
    When the coordinates are submitted
    Then the system should respond with 'Incorrect Format: Ensure the input contains only two numeric values for latitude and longitude.'
    And the status code should be 422

  Scenario: Scenario 4: Multiple Invalid Inputs
    Given the user inputs the coordinates 'abc,123'
    When the coordinates are submitted
    Then the system should respond with 'Invalid Input: Please enter valid numeric coordinates.'
    And the status code should be 400

  Scenario Outline: Scenario Outline: Valid Coordinate Input
    Given the user inputs valid geographic coordinates '<latitude>,<longitude>'
    When the coordinates are submitted
    Then the system should accept the coordinates for processing
    Examples:
      | latitude | longitude |
      | 37.7749 | -122.4194 |
      | 34.0522 | -118.2437 |
      | 40.7128 | -74.0060 |

