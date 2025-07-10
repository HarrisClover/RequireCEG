Feature: Car Search and Wishlist Management

  As a user
  I want to easily find and manage cars based on my preferences
  So that I can make informed decisions when purchasing a vehicle

  Background:
    Given the user accesses the used cars section on the Carwale website
    And the system offers a selection of cities starting with 'Chennai'

  Scenario: Scenario 1: Filter Cars by City
    Given the user selects 'Chennai'
    Then the system updates the car listings to show only vehicles available in 'Chennai'

  Scenario: Scenario 2: Set Budget Range
    Given the user has selected 'Chennai'
    When the user sets a budget range between 8 lakhs and 12 lakhs
    Then the system refines the listings to display cars within the specified budget

  Scenario: Scenario 3: View Cars with Photos Only
    Given the user has set the budget range
    When the user opts to view only cars with photos
    Then the system excludes any listings without images from the search results

  Scenario: Scenario 4: Filter by Manufacturer and Fuel Type
    Given the user has filtered the listings to cars with photos
    When the user selects 'Hyundai Creta' as the manufacturer and 'Petrol' as the fuel type
    Then the system narrows down the listings to show only petrol variants of Hyundai Creta within the desired budget and city

  Scenario: Scenario 5: Sort by Mileage
    Given the user has filtered to show 'Hyundai Creta' petrol variants
    When the user wishes to sort the remaining car listings by mileage
    Then the system sorts the remaining car listings by mileage from least to most
    And the user can identify the car with the lowest mileage to add to their wishlist

  Scenario: Scenario 6: Manage Wishlist
    Given the user has cars saved in their wishlist
    When the user navigates to the wishlist section and selects 'More Details' for a saved vehicle
    Then the system displays all relevant information in an organized overview section for the selected vehicle

  Scenario: Scenario 7: Secure Logout
    Given the user has completed their transactions or browsing activities
    When the user closes the browser
    Then the application ensures that the user is logged out successfully, terminating the session

  Scenario: Scenario 8: Ensure Filters are Applied Successfully
    Given the user has set the filters for city, budget, photos, manufacturer, and fuel type
    When all filters are applied
    Then the system confirms that filters have been applied successfully
    And the user sees the appropriate message indicating successful filter application
