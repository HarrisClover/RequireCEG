Feature: Name Input Validation on Test Page
  As a user interacting with the test page
  I want to input first and last names and see them validated
  So that I can ensure the system correctly handles name entries according to defined standards.

  Background:
    Given I am on the test page with name input fields

  Scenario: Successfully entering valid first and last names
    When I enter "John" into the first name field
    And I enter "Doe" into the last name field
    And I submit the name information
    Then the first name field should display "John"
    And the last name field should display "Doe"
    And I should see a success indicator for name validation

  Scenario Outline: Validating various first and last name inputs using data
    When I enter "<FirstName>" into the first name field
    And I enter "<LastName>" into the last name field
    And I submit the name information
    Then the first name field should display "<FirstName>"
    And the last name field should display "<LastName>"
    And the validation status should be "<Status>"

    # Examples sourced externally (e.g., CSV) or listed here
    Examples:
      | FirstName | LastName | Status         | Notes                       |
      | Alice     | Smith    | Success        | Standard valid names        |
      | Bob       | O'Malley | Success        | Name with apostrophe        |
      |           | Jones    | Failure        | Missing first name          |
      | Charles   |          | Failure        | Missing last name           |
      | D4vid     | Lee      | Failure        | Invalid character in first  |
      | Eve       | Sm1th    | Failure        | Invalid character in last   |
      |           |          | Failure        | Both names missing          |
      | VeryLongFirstNameIndeed | LastName | Failure        | First name exceeds length | # Assuming length validation
      | FirstName | VeryLongLastNameIndeed  | Failure        | Last name exceeds length  | # Assuming length validation

