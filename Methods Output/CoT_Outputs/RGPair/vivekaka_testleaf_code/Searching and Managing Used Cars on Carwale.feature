Feature: Searching and Managing Used Cars on Carwale
  As a user,
  I want to search for used cars based on my preferences
  So that I can find the right car within my budget and specifications

  Scenario: Searching for cars in Chennai with specific filters
    Given the user is on the Carwale website
    And the user navigates to the used cars section
    When the user filters cars by selecting 'Chennai' as the city
    And the user sets the budget range between 8 lakhs and 12 lakhs
    And the user selects 'Hyundai Creta' as the manufacturer
    And the user selects 'Petrol' as the fuel type
    And the user chooses to display only cars with photos
    Then the system should display a list of cars matching the selected filters
    And the cars should be sorted by mileage from least to most

  Scenario: Adding a car with the lowest mileage to the wishlist
    Given the user has searched for cars and the results are displayed
    When the user adds the car with the lowest mileage to their wishlist
    Then the system should confirm the car has been added to the wishlist

  Scenario: Viewing more details of a car in the wishlist
    Given the user has added a car to the wishlist
    When the user navigates to the wishlist
    And selects 'More Details' for the saved vehicle
    Then the system should display all relevant information under the overview section

  Scenario: Closing the browser after completing the browsing activity
    Given the user has finished browsing or completed their transaction
    When the user chooses to close the browser
    Then the browser should be closed successfully
