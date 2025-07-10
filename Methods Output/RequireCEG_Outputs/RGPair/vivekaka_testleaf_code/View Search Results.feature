Feature: View Search Results

  As a user of the Carwale website
  I want to search for used cars based on city and budget
  So that I can find a suitable vehicle that meets my criteria

  Background:
    Given the user accesses the Carwale website
    And navigates to the used cars section

  Scenario: Scenario 1: Select city and budget
    Given the search filters are populated for city and budget
    When the user selects 'Chennai' as the city
    Then the system should store the city selection
    And the user sets a budget range between 8 lakhs and 12 lakhs

  Scenario: Scenario 2: Invalid budget range
    Given the user sets a budget range where the lower limit is greater than the upper limit
    When the system validates the budget range
    Then an error message 'Invalid budget range' should be displayed

  Scenario: Scenario 3: Valid budget range and car search
    Given the user provides a valid budget range
    When the system queries the database for cars in Chennai within the specified budget
    Then a list of matching cars should be displayed

  Scenario: Scenario 4: Filter cars with photos
    Given the list of matching cars is displayed
    When the user opts to view only cars with photos
    Then the list should exclude any cars without associated images

  Scenario: Scenario 5: Narrow search by manufacturer and fuel type
    Given the user narrows the search by selecting 'Hyundai Creta' as the manufacturer
    And selects 'Petrol' as the fuel type
    When the system refines the results
    Then only vehicles fitting all selected criteria should be displayed

  Scenario: Scenario 6: Sort results by mileage
    Given the filtered car list is displayed
    When the results are sorted by mileage in ascending order
    Then the car with the lowest mileage should appear first

  Scenario: Scenario 7: Add car to wishlist
    Given the user selects the lowest mileage car
    When the user opts to add this car to their wishlist
    Then a confirmation message 'Car added to wishlist' should be displayed

  Scenario: Scenario 8: View wishlist details
    Given the user accesses their wishlist
    When the user selects 'More Details' for the saved 'Hyundai Creta'
    Then the system should provide an overview of the car's specifications, features, and pricing

  Scenario: Scenario 9: Close browser session
    Given the user has completed their searches or transactions
    When the user closes their browser
    Then there should be no hindrance from the system

  Scenario: Scenario 10: Ensure valid budget range
    Given the user has entered a valid budget range
    When the system validates the budget range
    Then the system should proceed to query the database for matching cars

  Scenario: Scenario 11: Validate condition of budget range
    Given the user has set a lower limit of the budget that is less than the upper limit
    Then the system should confirm the budget range is valid
