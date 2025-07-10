Feature: Access Carwale Website

  As a user
  I want to browse and filter used cars based on my preferences
  So that I can find suitable vehicles that meet my budget and requirements

  Background:
    Given the user is on the Carwale website
    And the navigational menu is displayed prominently

  Scenario: Filter cars by city and budget
    Given the user selects 'Used Cars' from the menu
    When the user sets the location to 'Chennai' and the budget range to 8 lakhs to 12 lakhs
    Then the system shall filter the available vehicles accordingly
    And only cars matching the specified criteria are displayed

  Scenario: Filter cars with photos
    Given the user is viewing the filtered car listings
    When the user chooses to view only cars with photos
    Then the search results shall update to show only listings that include images

  Scenario: Narrow down search by manufacturer and fuel type
    Given the user benefits from the previous filters
    When the user selects 'Hyundai Creta' as the manufacturer and 'Petrol' as the fuel type
    Then the system shall narrow down the search results accordingly

  Scenario: Sort cars by mileage
    Given multiple cars are displayed after filtering
    Then the system shall automatically sort these cars from least to most mileage

  Scenario: Save a vehicle to wishlist
    Given the user identifies the car with the lowest mileage
    When the user clicks the 'Add to Wishlist' button
    Then the system shall save this vehicle to their wishlist for future reference

  Scenario: View details from wishlist
    Given the user navigates to their wishlist
    When the user selects 'More Details' for the saved vehicle
    Then the system shall present all relevant information about that vehicle in an overview section

  Scenario: Closing browser after transactions
    Given the user has completed their transactions or browsing activities
    When the user closes the browser
    Then the system shall ensure that all data is preserved and no errors occur during exit

  Scenario: Display navigational menu
    Given the user accesses the Carwale website
    Then the system displays the navigational menu

  Scenario: Present car filtering interface
    Given the navigational menu is displayed prominently
    Then the system presents the car filtering interface

  Scenario: Sort displayed cars by mileage
    Given multiple cars are displayed after filtering
    Then the system sorts the displayed cars by mileage from least to most mileage

  Scenario: Preserve data upon closing browser
    Given the user has completed their browsing activities
    When the user closes the browser
    Then the system ensures that all data is preserved upon exit
