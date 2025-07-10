Feature: Updating Pet Records
  As a Pet Store Owner
  I want to update pet records with accurate information
  So that I can keep the data current

  Scenario Outline: Updating a pet record
    Given I am logged into the system
    When I update the pet with ID <pet-id> with the following details:
      | Name      | <name>   |
      | Category  | <category> |
      | Availability | <availability> |
      | Gender    | <gender> |
      | Birthday  | <birthday> |
    Then I should receive a "Success" message confirming the update

  Examples:
    | pet-id | name     | category | availability | gender | birthday  |
    | 1      | "Buddy"  | "Dog"    | "Available"  | "Male" | "2020-01-01" |
    | 2      | "Fluffy" | "Cat"    | "Unavailable" | "Female" | "2019-03-15" |

