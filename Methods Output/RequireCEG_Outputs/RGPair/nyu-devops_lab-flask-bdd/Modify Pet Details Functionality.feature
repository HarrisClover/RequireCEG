Feature: Modify Pet Details Functionality

  As a pet owner
  I want to modify details of my pets in the system
  So that I can keep the information up-to-date and accurate

  Background:
    Given a user is logged into the system
    And the user has selected a pet by its ID

  Scenario: Validating inputs and updating pet details
    Given the user modifies the pet's Name to 'Buddy'
    And the user modifies the pet's Category to 'Dog'
    And the user modifies the pet's Availability to 'Available'
    And the user modifies the pet's Gender to 'Male'
    When the user submits the changes
    Then the system validates the input fields
    And the system saves the new information
    And the system displays a 'Success' message

  Scenario: Handling invalid birthday format
    Given the user modifies the pet's Birthday to '2023-15-01'
    When the user submits the changes
    Then the system shows an error message indicating the correct format for Birthday
    And the input fields are not saved

  Scenario: No changes made
    Given the user does not modify any fields
    When the user submits without making any changes
    Then the system informs the user that no updates were necessary

  Scenario: Successful update of pet details with clear fields
    Given the user modifies the pet's Name to 'Bella'
    When the user submits the changes
    Then the system validates the input fields
    And the system saves the new information
    And the system clears all fields for future modifications
    And the system displays a 'Success' message

  Scenario: Handling form submission without changes
    Given the user submits without making any changes
    Then the system informs the user that no updates were necessary
