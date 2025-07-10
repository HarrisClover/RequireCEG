Feature: Navigate to Used Cars Section

  As a user
  I want to filter used cars by city, budget, manufacturer, and fuel type
  So that I can find the most suitable vehicles for my preferences

  Background:
    Given the user accesses the Carwale website
    And the system provides an option to navigate to the used cars section

  Scenario: Scenario 1: Filter by City
    Given the user selects 'Chennai' as their preferred city
    When the user views the available vehicles
    Then only vehicles listed in Chennai should be displayed

  Scenario: Scenario 2: Set Budget Range
    Given the user has selected 'Chennai'
    When the user sets a budget range between 8 lakhs and 12 lakhs
    Then only vehicles priced within this range should be displayed

  Scenario: Scenario 3: View Cars with Photos
    Given the user has set the budget range
    When the user opts to view only cars with photos
    Then the system should exclude vehicles without images from the results

  Scenario: Scenario 4: Filter by Manufacturer and Fuel Type
    Given the user is viewing cars with photos
    When the user selects 'Hyundai Creta' as the manufacturer and 'Petrol' as the fuel type
    Then the system should filter the results to only display vehicles that are 'Hyundai Creta' and 'Petrol'

  Scenario: Scenario 5: Sort Cars by Mileage
    Given the user has filtered vehicles by manufacturer and fuel type
    When the user sorts the results by mileage
    Then the system should organize the cars in ascending order based on mileage

  Scenario: Scenario 6: Add Car to Wishlist
    Given the user identifies a car with the lowest mileage
    When the user opts to add this vehicle to their wishlist
    Then the vehicle should be saved for future reference

  Scenario: Scenario 7: View Wishlist Details
    Given the user navigates to their wishlist
    When the user selects 'More Details' for a saved vehicle
    Then the system should present all relevant information in the overview section for that vehicle

  Scenario: Scenario 8: Close the Browser
    Given the user has completed their browsing activities or transactions
    When the user decides to close the browser
    Then the application shall allow the user to close the browser at their own convenience

  Scenario: Scenario 9: Verify Budget Filtering
    Given the user has set the budget range
    When the user views the available vehicles
    Then only vehicles within the specified budget range between 8 lakhs and 12 lakhs should be displayed and the system should refine the search results accordingly

  Scenario: Scenario 10: Ensure Non-Null Results for Images
    Given the user opts to view only cars with photos
    When the user views the filtered results
    Then all displayed vehicles must have images and none should be excluded

  Scenario: Scenario 11: Confirm Excluded Features
    Given the user has specified preferences
    When the user opts to view vehicles
    Then the vehicles should have both images and adhere to the selected budget constraints
