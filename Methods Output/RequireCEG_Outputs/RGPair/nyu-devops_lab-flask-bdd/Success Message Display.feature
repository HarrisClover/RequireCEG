Feature: Pet Record Management

  As a pet store owner
  I want to manage pet records effectively
  So that I can ensure all required information is captured accurately and confirm successful entries/updates

  Background:
    Given the pet record form is available
    And the required fields are Name, Category, Availability, Gender, and Birthday

  Scenario: Scenario 1: Successful Creation of a Pet Record
    Given all required fields are filled in correctly
    When the user submits the pet record form
    Then a 'Success' message should be displayed to confirm the record's creation

  Scenario: Scenario 2: Error on Missing Required Fields
    Given the user leaves a required field empty
    When the user submits the pet record form
    Then an error message should prompt the user to fill in the missing information

  Scenario: Scenario 3: Automatic Form Clearing After Creation
    Given the user has successfully created a pet record
    When the user tries to enter another pet record without clearing the fields
    Then the form should clear automatically for fresh input

  Scenario: Scenario 4: Successful Update of an Existing Pet Record
    Given all required fields for the update are filled in correctly
    When the user submits valid updates for the pet record
    Then a 'Success' message should be displayed upon successful updates

  Scenario: Scenario 5: Error on Invalid Update Information
    Given the user attempts to update a pet record with missing required fields
    When the user submits the update form
    Then an error message should be displayed, guiding the user to correct the inputs

  Scenario: Scenario 6: Multiple Inputs for Record Creation
    Given the pet record form state is filled
    And the user has 'Name' empty
    When the user tries to submit the pet record form
    Then an error message should prompt the user to fill in the missing information

  Scenario: Scenario 7: Multiple Inputs for Record Updates
    Given the pet record form state is filled
    And the user has 'Birthday' empty
    When the user tries to submit the update form
    Then an error message should be displayed guiding the user to correct the inputs

  Scenario Outline: Scenario Outline: Creating or Updating Pet Records
    Given the pet record form state is '<formState>'
    And the user has '<missingFields>' missing fields
    When the user tries to submit the pet record form
    Then the outcome should be '<outcome>'
    Examples:
      | formState | missingFields | outcome |
      | empty | none | Success |
      | filled | none | Success |
      | filled | Name | Error |
      | filled | Birthday | Error |

