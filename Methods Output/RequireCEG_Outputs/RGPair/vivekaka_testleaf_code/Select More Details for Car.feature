Feature: Vehicle Information Retrieval and Filtering

  As a user looking for a vehicle
  I want to view detailed information about a saved vehicle and filter search results for used cars
  So that I can make informed decisions based on my preferences

  Background:
    Given the user has a wishlist of vehicles
    And the user is logged into the system

  Scenario: Scenario 1: View Vehicle Overview
    Given the user accesses their wishlist
    When the user selects a saved vehicle
    Then the system retrieves and displays all relevant information about the vehicle in the overview section

  Scenario: Scenario 2: Filter Used Cars
    Given the user navigates to the used cars section
    When the user applies filters for city, budget, manufacturer, and fuel type
    Then the system shows only the cars that meet all specified criteria

  Scenario: Scenario 3: View Cars With Photos
    Given the user opts to view cars with photos
    When the request is processed by the system
    Then the results are limited to only those vehicles with accompanying images

  Scenario: Scenario 4: Sort Cars by Mileage
    Given multiple cars fit the search criteria
    When the user views the results
    Then the results are sorted by mileage from least to most

  Scenario: Scenario 5: Add Lowest Mileage Car to Wishlist
    Given the user identifies a car with the lowest mileage
    When the user opts to add this vehicle to their wishlist
    Then the vehicle is added to the user's wishlist for future reference

  Scenario: Scenario 6: Save Session Automatically
    Given the user closes the browser after reviewing vehicle details
    Then the user's session is saved automatically

  Scenario: Scenario 7: View Filtered Search Results
    Given the user applies filters for city equal to 'Chennai', budget between 8 lakhs and 12 lakhs, manufacturer equal to 'Hyundai Creta', and fuel type equal to 'Petrol'
    When the user views the results
    Then the system shows only the cars that meet all the filter criteria

  Scenario: Scenario 8: View Cars with Specific Image Standards
    Given the user opts to view cars with photos
    When the user targets cars that meet image standards for display
    Then the user will only see the cars that have accompanying images

  Scenario: Scenario 9: Ensure Wishlist Functionality
    Given the user has a wishlist of vehicles
    When the user navigates back to the homepage
    Then the wishlist can be retrieved easily upon the next visit
