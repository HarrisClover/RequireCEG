Feature: Used Car Search and Wishlist Management on Carwale

  As a potential car buyer
  I want to search for specific used cars on Carwale, filter them, sort them, add one to my wishlist, and view its details
  So that I can efficiently find a suitable used car that meets my criteria and save it for later review

  Scenario: Filter used cars, sort by mileage, add to wishlist, and view details
    Given the user is on the Carwale homepage
    And the user navigates to the 'Used Cars' section

    When the user filters by City 'Chennai'
    And the user sets the budget between '8 Lakhs' and '12 Lakhs'
    And the user selects the 'Cars with Photos' option
    And the user selects Manufacturer 'Hyundai' and Model 'Creta'
    And the user selects Fuel Type 'Petrol'
    And the user applies sorting by 'Mileage - Low to High'

    Then the search results should display only 'Hyundai Creta' cars with 'Petrol' fuel type in 'Chennai' between '8 Lakhs' and '12 Lakhs' with photos
    And the results should be sorted by mileage from lowest to highest

    When the user adds the first listed car (lowest mileage) to the wishlist
    And the user navigates to the 'Wishlist'
    And the user selects 'More Details' for the saved car in the wishlist
    Then the car's overview section should display its relevant details
    When the user closes the browser