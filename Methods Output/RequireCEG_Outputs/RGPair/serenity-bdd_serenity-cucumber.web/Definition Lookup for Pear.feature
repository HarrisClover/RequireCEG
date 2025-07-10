Feature: Definition Lookup for 'Pear'

  As a user looking to understand terms
  I want to retrieve definitions of terms from the system
  So that I can gain better knowledge about various terms

  Background:
    Given the system is ready to accept user input
    And the database contains definitions of terms including 'Pear'

  Scenario: Scenario 1: Valid input for 'Pear'
    Given the user inputs 'Pear'
    When the system processes the input
    Then the definition 'A sweet, tree-grown fruit that is typically green, yellow, or brown in color.' should be displayed

  Scenario: Scenario 2: Invalid input
    Given the user inputs 'InvalidTerm'
    When the system processes the input
    Then the message 'Definition not found for the entered term.' should be displayed

  Scenario: Scenario 3: Synonymous term input
    Given the user inputs 'Pyrus'
    When the system processes the input
    Then the definition 'A sweet, tree-grown fruit that is typically green, yellow, or brown in color.' should be displayed

  Scenario: Scenario 4: Empty input
    Given the user inputs ''
    When the system processes the input
    Then the message 'Please enter a term to look up its definition.' should be displayed

  Scenario: Scenario 5: Missing input
    Given the user does not provide any input
    When the system processes the request
    Then the message 'Please enter a term to look up its definition.' should be displayed

  Scenario: Scenario 6: Invalid input and empty input
    Given the user inputs 'InvalidTerm' and then inputs ''
    When the system processes both inputs
    Then the system should first display 'Definition not found for the entered term.'

  Scenario: Scenario 7: XOR behavior check
    Given the user inputs both 'Pear' and 'Pyrus'
    When the system processes the inputs
    Then the definition should only return for one of the entries based on precedence.
