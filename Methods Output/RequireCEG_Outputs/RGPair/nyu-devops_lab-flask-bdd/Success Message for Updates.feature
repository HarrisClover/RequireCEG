Feature: Success Message for Updates

  As a pet owner
  I want to update pet information in the system
  So that I can ensure that the pet records are accurate and up-to-date

  Background:
    Given the pet update request contains all required fields
    And the data formats are correctly aligned with the expected formats

  Scenario: Valid update with all fields filled and correct formats
    Given a complete pet update request with valid pet ID, name, and details
    When submitting the update request
    Then the system displays the message 'Update Successful'
    And all input fields are cleared

  Scenario: Invalid update due to missing required fields
    Given an update request missing the pet name or pet ID
    When submitting the update request
    Then the system presents the message 'Update Failed: Invalid Input'

  Scenario: Invalid update due to incorrect data formats
    Given an update request with a non-numeric pet ID
    When submitting the update request
    Then the system presents the message 'Update Failed: Invalid Input'

  Scenario: Update for a non-existent pet ID
    Given the provided pet ID does not match any existing records
    When submitting the update request
    Then the system presents the message 'Update Failed: Pet Not Found'

  Scenario: Update marking the pet as Unavailable
    Given an update request that changes the pet's status to Unavailable
    When submitting the update request
    Then the system presents a warning 'Note: The pet is now marked as Unavailable'
    And the system displays the message 'Update Successful'

  Scenario: Invalid update with previously unavailable pet status
    Given an update request for a pet ID that is not altered to 'Unavailable'
    When submitting the update request
    Then the system presents the message 'Update Failed: Invalid Input'
