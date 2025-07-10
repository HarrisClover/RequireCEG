Feature: Input Validation for New Pet Entries

  As a pet store owner
  I want to validate the input fields for new pet entries
  So that I can ensure accurate and complete information is provided for each pet

  Background:
    Given the user is on the new pet entry form
    And the user has not submitted the form yet

  Scenario: Scenario 1: Name field is empty
    Given the Name field is empty
    When the user tries to submit the form
    Then the message 'Name is required.' should be displayed

  Scenario: Scenario 2: Category is not selected
    Given the Category field is not selected
    When the user tries to submit the form
    Then the message 'Category must be chosen.' should be displayed

  Scenario: Scenario 3: Availability set to Available with empty Gender
    Given the Availability field is set to 'Available' and the Gender field is empty
    When the user tries to submit the form
    Then the message 'Gender is required for available pets.' should be displayed

  Scenario: Scenario 4: Future date in Birthday field
    Given the Birthday field contains a future date
    When the user tries to submit the form
    Then the message 'Birthday cannot be in the future.' should be displayed

  Scenario: Scenario 5: All fields filled correctly
    Given all fields are filled correctly
    When the user tries to submit the form
    Then the new pet entry will be created successfully
    And the message 'Success' should be displayed

  Scenario: Scenario 6: Submit with Gender empty while Availability is Available and Name filled out correctly with Category not selected (AND Condition Satisfied), Expecting Gender is required message shown for error output logic recorded on instance screens.
    Given the Availability field is set to 'Available' and the Gender field is empty, Name filled, Category not selected
    When the user tries to submit the form
    Then the message 'Gender is required for available pets.' should be displayed

  Scenario: Scenario 7: Submit with Availability not selected while Gender is filled correctly with Name and Category empty, Expecting Gender is required message shown for error output logic recorded on instance screens.
    Given the Availability field is empty, Gender filled, Name and Category not filled
    When the user tries to submit the form
    Then the message 'Name is required.' should be displayed
