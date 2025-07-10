Feature: Candidate Management
  As a system administrator
  I want to register candidates for an election
  So that they can receive votes.

  Scenario: Registering multiple candidates successfully
    Given the election system is ready
    When I register the following candidates:
      | Identifier | Name          | Registration Date |
      | C1         | Alice Alison  | 2023-10-01        |
      | C2         | Bob Barker    | 2023-10-02        |
      | C3         | Charlie Chaplin | 2023-09-30        |
    Then the system should have 3 registered candidates
    And candidate "C1" should exist with name "Alice Alison" and registration date "2023-10-01"
    And candidate "C2" should exist with name "Bob Barker" and registration date "2023-10-02"
    And candidate "C3" should exist with name "Charlie Chaplin" and registration date "2023-09-30"

