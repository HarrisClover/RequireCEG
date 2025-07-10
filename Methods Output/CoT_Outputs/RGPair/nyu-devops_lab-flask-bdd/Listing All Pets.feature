Feature: Listing All Pets
  As a Pet Store Owner
  I want to see a list of all pets in my store
  So that I can manage and track them

  Scenario: Listing all pets
    Given I am logged into the system
    When I request to view all pets
    Then I should see a list of pets with their details

