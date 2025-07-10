Feature: Show Only Cars with Photos

  As a user searching for vehicles
  I want to filter available cars by city, budget, manufacturer, fuel type, and photos
  So that I can find the best options that meet my criteria

  Background:
    Given the user is presented with the option to filter cars
    And the database contains multiple vehicles with various attributes

  Scenario: Scenario 1: Cars Found with Photos
    Given the user selects 'Chennai' as the city
    And the user sets a budget range between 8 lakhs and 12 lakhs
    And the user selects 'Hyundai Creta' as the manufacturer
    And the user chooses 'Petrol' as the fuel type
    And there are vehicles in the database that meet all the specified filtering criteria
    And there are vehicles that have accompanying images
    When the user applies the filters
    Then the system displays the list of available cars with photos
    And the cars are sorted by mileage in ascending order

  Scenario: Scenario 2: No Cars Found
    Given the user selects 'Chennai' as the city
    And the user sets a budget range between 5 lakhs and 7 lakhs
    And there are no vehicles in the database that meet the specified criteria
    When the user applies the filters
    Then the system displays a notification message stating that no cars meet their search parameters

  Scenario: Scenario 3: Filtered Cars with Missing Photos
    Given the user selects 'Delhi' as the city
    And the user sets a budget range between 10 lakhs and 15 lakhs
    And the user selects 'Maruti Suzuki' as the manufacturer
    And the user chooses 'Petrol' as the fuel type
    And there are vehicles that have no accompanying images
    When the user applies the filters
    Then the system displays the list of available cars without photos
    And the cars are sorted by mileage in ascending order

  Scenario Outline: Scenario Outline: Cars Filtered by Various Criteria
    Given the user selects '<city>' as the city
    And the user sets a budget range between <min-budget> and <max-budget>
    And the user selects '<manufacturer>' as the manufacturer
    And the user chooses '<fuel-type>' as the fuel type
    When the user applies the filters
    Then the system displays the list of available cars with photos
    And the cars are sorted by mileage in ascending order
    Examples:
      | city | min-budget | max-budget | manufacturer | fuel-type |
      | Chennai | 8 lakhs | 12 lakhs | Hyundai Creta | Petrol |
      | Chennai | 8 lakhs | 10 lakhs | Toyota Corolla | Diesel |
      | Mumbai | 9 lakhs | 15 lakhs | Honda City | Petrol |

