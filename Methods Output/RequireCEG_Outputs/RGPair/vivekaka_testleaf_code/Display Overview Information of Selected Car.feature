Feature: Display Overview Information of Selected Car

  As a user
  I want to view detailed information about a saved vehicle in my wishlist
  So that I can make an informed decision about the vehicle

  Background:
    Given the user is logged into the system
    And the user has a wishlist containing various vehicles

  Scenario: Scenario 1: Car exists in the wishlist
    Given the user selects 'More Details' for a saved vehicle
    When the system checks if the selected car exists in the user's wishlist
    Then the system retrieves the overview information for the car
    And displays mileage, photos, fuel type, and manufacturer

  Scenario: Scenario 2: Car does not exist in the wishlist
    Given the user selects 'More Details' for a car not in the wishlist
    When the system checks if the selected car exists in the user's wishlist
    Then the system displays a message prompting the user to add the car to the wishlist first

  Scenario: Scenario 3: Hyundai Creta with petrol engine selected from wishlist with no photos available
    Given the user selects a Hyundai Creta with a petrol engine from the wishlist
    When the system retrieves the overview information
    Then displays mileage information prominently
    And indicates that photos are unavailable in the overview

  Scenario: Scenario 4: Previous filter information included when selecting the car with lower mileage
    Given the user has completed a search for used cars in Chennai within a budget range
    And the user has added a car with the lowest mileage to their wishlist
    When the user selects 'More Details' for the car in the wishlist
    Then the system includes a section in the overview displaying the previous filters used during the search
    And retrieves the comprehensive vehicle details

  Scenario: Scenario 5: No photos available for selected car
    Given the user selects a car that has no photos available
    When the system retrieves the overview information for this car
    Then indicates that photos are unavailable in the overview

  Scenario: Scenario 6: User completes search within budget range and adds car to wishlist
    Given the user has completed a search for used cars in Chennai within a specified budget range
    And the user has added a car with the lowest mileage to their wishlist
    When the user selects 'More Details' for the car in the wishlist
    Then the system includes a section in the overview displaying the previous filters used during the search
