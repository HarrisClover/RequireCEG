Feature: Filtering Available Pets
  As a Pet Store Owner
  I want to filter pets by their availability status
  So that I can manage pets that are currently available for adoption

  Scenario Outline: Filtering available pets
    Given I am logged into the system
    When I filter pets by availability "<availability>"
    Then I should see a list of pets with the availability status "<availability>"

  Examples:
    | availability |
    | "Available"  |
    | "Unavailable"|

