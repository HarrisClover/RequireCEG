Feature: Managing Pet Data State
  As a Pet Store Owner
  I want the system to manage the state of pet data correctly
  So that I can always work with up-to-date information

  Scenario: Clearing fields after pet operations
    Given I have just created or updated a pet record
    When the operation is successful
    Then the fields should be cleared, and I should see the most recent information based on the pet's ID
