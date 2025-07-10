Feature: Input and Validation of First and Last Names
As a user,
I want to input my first and last names on a test page
So that the system can validate and reflect the correct values in the respective fields

Scenario Outline: Validating First and Last Names
Given that I am on the test page
When I enter my first name "<first-name>" and last name "<last-name>"
Then the system should display my first name as "<expected-first-name>" and last name as "<expected-last-name>"
And the system should validate the names according to the required standards

Examples:
| first-name | last-name | expected-first-name | expected-last-name |
| John       | Doe       | John                | Doe                |
| Alice      | Smith     | Alice               | Smith              |
| Invalid1   | 1234      | Invalid1            | 1234               |
| !@#        | Test      | !@#                 | Test               |

Scenario: Data-driven Testing for First and Last Names using External Data Source
Given that the system supports data-driven testing from external sources
When I use a CSV file with first and last name entries
Then the system should validate and reflect each name entry according to the specified rules

Scenario: Name Lookup for Terms
Given that I am on the name lookup page
When I search for the definition of "apple"
Then the system should display the definition of "apple"
When I search for the definition of "pear"
Then the system should display the definition of "pear"

Scenario: Validation in Headless Mode
Given that the system supports headless execution using HtmlUnit or PhantomJS
When I input valid first and last names
Then the system should correctly reflect the entered names without errors in headless mode

Scenario: Validation in Browser Mode
Given that the system supports browser-based execution
When I input valid first and last names in the browser
Then the system should correctly reflect the entered names without errors in the browser
