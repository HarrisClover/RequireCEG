Feature: Searching Pets by Category
  As a Pet Store Owner
  I want to search for pets by category
  So that I can find specific types of pets quickly

  Scenario Outline: Searching pets by category
    Given I am logged into the system
    When I search for pets by the category "<category>"
    Then I should see a list of pets in the "<category>" category

  Examples:
    | category  |
    | "Dog"     |
    | "Cat"     |

