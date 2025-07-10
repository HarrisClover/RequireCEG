Feature: Create Candidates with Unique Identifiers

  As a system administrator
  I want to register candidates with unique identifiers
  So that the integrity of the candidate database is maintained

  Background:
    Given the system is operational
    And the user has access to the registration interface

  Scenario: Scenario 1: Successful candidate registration
    Given the unique identifier 'CAND123' does not exist in the system
    And the candidate's name is 'John Doe'
    When the user submits the registration
    Then the candidate 'John Doe' should be created successfully
    And the candidate's details should be stored with the current registration date

  Scenario: Scenario 2: Registration fails due to duplicate identifier
    Given the unique identifier 'CAND123' already exists in the system
    When the user attempts to register a candidate with identifier 'CAND123'
    Then the system should display the message 'Error: Candidate identifier must be unique.'

  Scenario: Scenario 3: Allow registration of the same name with different identifiers
    Given the unique identifier 'CAND456' does not exist in the system
    When the user registers 'John Doe' with the unique identifier 'CAND456'
    Then the candidate 'John Doe' should be successfully created under a different identifier 'CAND456'

  Scenario: Scenario 4: Retrieve list of registered candidates
    Given there are registered candidates in the system
    When the user requests to retrieve candidates
    Then the system should output a list with each candidate's unique identifier, name, and registration date

  Scenario: Scenario 5: Attempt to register with a non-unique identifier
    Given the unique identifier 'CAND789' already exists in the system
    When the user tries to create a new candidate with the identifier 'CAND789'
    Then the system should respond with 'Error: Candidate identifier must be unique.'

  Scenario Outline: Scenario Outline: Registering different candidates
    Given the unique identifier <identifier> does not already exist
    And the candidate's name is <name>
    When the user submits the registration
    Then the candidate <name> should be created with identifier <identifier>
    Examples:
      | identifier | name |
      | CAND789 | Alice Smith |
      | CAND990 | Bob Johnson |
      | CAND123 | Charlie Brown |

