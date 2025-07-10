Feature: Name Validation, Data-Driven Testing, and Term Definition Lookup
  As a tester and user,
  I want to ensure that the system validates first and last names correctly across different web drivers and execution modes,
  And that it supports data-driven testing from external CSV files,
  And allows users to look up accurate definitions for key terms,
  So that robust functionality and compatibility can be ensured across headless and browser-based environments.

  # Scenario for successful name entry
  Scenario Outline: Successful Name Input and Display
    Given the test page is loaded with the name input form using the "<driver>" driver in "<mode>" mode
    When the user enters the valid first name "<firstName>" and the valid last name "<lastName>"
    And the user submits the name input form
    Then the system should reflect the entered first name as "<firstName>" and the last name as "<lastName>"

    Examples:
      | driver    | mode     | firstName | lastName  |
      | HtmlUnit  | headless | John      | Doe       |
      | PhantomJS | browser  | Jane      | Smith     |

  # Scenario for failing name entry due to invalid format
  Scenario Outline: Failing Name Input Due to Validation Error
    Given the test page is loaded with the name input form using the "<driver>" driver in "<mode>" mode
    When the user enters an invalid first name "<firstName>" or invalid last name "<lastName>"
    And the user submits the name input form
    Then the system should display a validation error indicating the incorrect name format

    Examples:
      | driver    | mode     | firstName | lastName  |
      | HtmlUnit  | headless | 123       | Doe       |
      | PhantomJS | browser  | Jane      | !@#       |

  # Scenario for data-driven testing using an external CSV file
  Scenario Outline: Data-Driven Name Validation from CSV Data
    Given the test page is loaded with the name input form using the "<driver>" driver in "<mode>" mode
    And the system imports test data from the CSV file "<csvFile>"
    When the user enters the first name "<firstName>" and the last name "<lastName>" from the CSV data
    And the user submits the name input form
    Then the system should display the correct first and last names as provided in the CSV

    Examples:
      | driver    | mode     | csvFile         | firstName | lastName |
      | HtmlUnit  | headless | valid_names.csv | Alice     | Johnson  |
      | PhantomJS | browser  | valid_names.csv | Bob       | Brown    |

  # Scenario for term definition lookup
  Scenario Outline: Term Definition Lookup
    Given the definition lookup page is loaded using the "<driver>" driver in "<mode>" mode
    When the user searches for the definition of the term "<term>"
    Then the system should display an accurate description for the term "<term>"

    Examples:
      | driver    | mode     | term  |
      | HtmlUnit  | headless | apple |
      | PhantomJS | browser  | pear  |
