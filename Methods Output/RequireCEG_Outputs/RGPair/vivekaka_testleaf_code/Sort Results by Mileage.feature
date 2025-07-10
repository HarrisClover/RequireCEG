Feature: Sort Results by Mileage

  As a user accessing the used cars section of a website
  I want to filter and retrieve car listings based on specific criteria
  So that I can find the best car options that suit my needs

  Background:
    Given the user is on the used cars section of the Carwale website
    And the user has set the filters correctly

  Scenario: Scenario 1: Filter and Retrieve Cars
    Given the user selects 'Chennai' as the city
    And the user sets the budget range between 8 lakhs and 12 lakhs
    When the user applies filters including photos only, 'Hyundai Creta' as the manufacturer, and 'Petrol' as the fuel type
    Then the system validates the inputs for correctness and applicability
    And retrieves all relevant car listings that meet these criteria from the database

  Scenario: Scenario 2: Sorting Car Listings by Mileage
    Given the user has retrieved car listings based on the applied filters
    When the system sorts these listings by mileage from least to most
    Then the car with the lowest mileage is identified
    And automatically added to the user's wishlist for future reference

  Scenario: Scenario 3: Validation Check
    Given the user has applied filters correctly
    When the system performs input validation
    Then the system confirms successful validation of inputs

  Scenario: Scenario 4: Retrieve Relevant Car Listings
    Given the filters have been applied successfully
    When the system retrieves relevant car listings from the database
    Then the listings are sorted by mileage
    And the car with the lowest mileage is identified

  Scenario Outline: Scenario Outline: View Car Details from Wishlist
    Given the user accesses their wishlist
    When the user selects 'More Details' for the car with the lowest mileage
    Then the system presents a comprehensive overview section displaying all pertinent information related to the selected car
    Examples:
      | Car Model | Mileage | Price | Features |
      | Hyundai Creta | 15 km/l | ₹10,00,000 | Sunroof, Automatic Transmission |
      | Hyundai Creta | 18 km/l | ₹11,00,000 | Leather Seats, Navigation System |
      | Hyundai Creta | 14 km/l | ₹9,50,000 | Alloy Wheels, Rear Camera |

