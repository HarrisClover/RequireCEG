Feature: User Input Validation for Names

  As a system user
  I want to validate user input for first name and last name
  So that I can ensure the data entered conforms to the required criteria

  Background:
    Given the user is on the name submission page
    And the system has a defined set of acceptable names

  Scenario: Scenario 1: Valid first name and last name
    Given the user enters 'John' for first name
    And the user enters 'Doe' for last name
    When the user submits the form
    Then the system should display 'Names are valid.'

  Scenario: Scenario 2: Empty first name
    Given the user enters '' for first name
    When the user submits the form
    Then the system should display 'Please enter a valid first name.'

  Scenario: Scenario 3: Last name contains special characters
    Given the user enters 'Doe' for first name
    And the user enters 'Doe@2023' for last name
    When the user submits the form
    Then the system should display 'Last name must only contain letters.'

  Scenario: Scenario 4: Request definition for 'apple'
    When the user requests the definition of 'apple'
    Then the system should return the description of 'apple.'

  Scenario: Scenario 5: Request definition for 'pear'
    When the user requests the definition of 'pear'
    Then the system should return the description of 'pear.'

  Scenario: Scenario 6: Last name matches predefined names
    Given the user enters 'Jane' for first name
    And the user enters 'Smith' for last name
    When the user submits the form
    Then the system should display 'Names are valid.'
