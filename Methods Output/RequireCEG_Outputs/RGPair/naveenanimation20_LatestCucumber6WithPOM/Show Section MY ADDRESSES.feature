Feature: Show Section 'MY ADDRESSES'

  As a logged-in user
  I want to view and manage my saved addresses
  So that I can easily keep track of where I want items delivered

  Background:
    Given the user is logged into their account
    And the user navigates to the Accounts page

  Scenario: Scenario 1: Addresses available
    Given the user has previously saved addresses
    When the user views the 'MY ADDRESSES' section
    Then the system displays the list of saved addresses
    And the section shows the title 'MY ADDRESSES'

  Scenario: Scenario 2: No addresses available
    Given the user has no saved addresses
    When the user views the 'MY ADDRESSES' section
    Then the system shows a message stating 'No addresses available.'

  Scenario: Scenario 3: Adding a new address successfully
    Given the user chooses to add a new address
    And the user enters all required address fields correctly
    When the user submits the form with valid details
    Then the system validates the input
    And the address is saved in the database
    And the system displays a confirmation message stating 'Address added successfully.'

  Scenario: Scenario 4: Error in address submission due to missing fields
    Given the user chooses to add a new address
    And the user misses required fields or enters invalid data
    When the user submits the form
    Then the system shows an error message indicating which fields need to be completed or corrected.

  Scenario Outline: Scenario Outline: Adding address validation
    Given the user fills in the address fields with <input-data>
    When the user submits the new address
    Then the system should return <validation-result>
    Examples:
      | input-data | validation-result |
      | Valid address details | Address added successfully. |
      | Missing street address | Error: Street address is required. |
      | Invalid zip code | Error: Zip code is invalid. |
      | Missing city | Error: City is required. |

