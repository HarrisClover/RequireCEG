Feature: Creating a New Pet Entry
  As a Pet Store Owner
  I want to create new pet entries with Name, Category, Availability, Gender, and Birthday
  So that I can manage the pets in my store

  Scenario Outline: Creating a new pet entry
    Given I am logged into the system
    When I create a new pet with the following details:
      | Name      | <name>   |
      | Category  | <category> |
      | Availability | <availability> |
      | Gender    | <gender> |
      | Birthday  | <birthday> |
    Then the system should return a "Success" message

  Examples:
    | name     | category | availability | gender | birthday  |
    | "Buddy"  | "Dog"    | "Available"  | "Male" | "2020-01-01" |
    | "Fluffy" | "Cat"    | "Unavailable" | "Female" | "2019-03-15" |

