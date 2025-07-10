Feature: Add Contacts with Metadata

  As an administrator
  I want to add contacts with mandatory fields and validate their uniqueness
  So that I can maintain a reliable contact list without duplicates

  Background:
    Given the administrator accesses the 'Add Contacts' interface
    And the 'Name' and 'Contact Details' fields are displayed as required

  Scenario: Scenario 1: Submission with empty fields
    Given the 'Name' field is empty
    And the 'Contact Details' field is empty
    When the administrator clicks 'Submit'
    Then the system should display an error message prompting the administrator to complete the required fields

  Scenario: Scenario 2: Adding a new contact
    Given the 'Name' field is filled with 'John Doe'
    And the 'Contact Details' field is filled with 'john.doe@example.com'
    When the administrator clicks 'Submit'
    Then the contact information should be saved to the database
    And the system should display a confirmation message to the administrator upon successful addition of the contact

  Scenario: Scenario 3: Attempt to add an existing contact
    Given the 'Name' field is filled with 'Jane Smith'
    And the 'Contact Details' field is filled with 'jane.smith@example.com'
    When the administrator clicks 'Submit'
    Then the system should check for existing contacts
    And the system should display a warning message that the contact already exists

  Scenario: Scenario 4: Attempt to add a duplicate contact
    Given the 'Name' field is filled with 'Existing Contact'
    And the 'Contact Details' field is filled with 'existing.contact@example.com'
    When the administrator clicks 'Submit'
    Then the system should display a warning message that the contact already exists

  Scenario Outline: Scenario Outline: Filtering contacts by metadata
    Given the administrator has contacts in the database
    And the administrator applies filters based on <filter-criteria>
    When the administrator clicks 'Apply Filters'
    Then the system should display only the contacts matching the <filter-criteria>
    Examples:
      | filter-criteria | expected-result |
      | Name contains 'John' | Display all contacts with 'John' in their name |
      | Contact Details includes '@example.com' | Display all contacts with '@example.com' in their contact details |
      | Name starts with 'J' | Display all contacts whose names start with 'J' |

