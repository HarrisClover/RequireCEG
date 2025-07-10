Feature: Select Manufacturer Filter

  As a car buyer
  I want to filter used cars based on my preferences
  So that I can find the best used car that fits my criteria

  Background:
    Given the user is on the used cars search page
    And no filters are applied yet

  Scenario: Scenario 1: Filter by Manufacturer
    Given the user selects 'Hyundai Creta' as the manufacturer
    When the user applies the filter
    Then the search results should only include used cars from 'Hyundai Creta'
    And the action to filter the results should be applied

  Scenario: Scenario 2: Filter by City
    Given the user has selected 'Hyundai Creta' as the manufacturer
    When the user specifies 'Chennai' as the city
    Then the search results should only show used cars located in Chennai
    And the action to refine the search results should be applied

  Scenario: Scenario 3: Filter by Budget
    Given the user has specified 'Chennai' as the city
    When the user sets a budget range between 8 lakhs and 12 lakhs
    Then the search results should only show cars within the budget range
    And the action to show cars that fall within the budget should be applied

  Scenario: Scenario 4: Filter by Fuel Type
    Given the user has set a budget range between 8 lakhs and 12 lakhs
    When the user selects 'Petrol' as the fuel type
    Then the search results should be limited to petrol vehicles only
    And the action to limit results based on fuel type should be applied

  Scenario: Scenario 5: Filter by Photo Availability
    Given the user has selected 'Petrol' as the fuel type
    When the user indicates a preference for viewing only cars with photos
    Then the search results should display only vehicles that have uploaded images
    And the action to filter results by photo availability should be applied

  Scenario: Scenario 6: Sort by Mileage
    Given the user has applied all the filters
    When the user views the search results
    Then the results should be sorted by mileage from least to most
    And the user should be able to add the car with the lowest mileage to their wishlist
    And the action to sort the results by mileage should be applied

  Scenario: Scenario 7: Combined Filter and Sort
    Given the user has applied filters for manufacturer, city, budget, fuel type, and photo availability
    When the user views the combined search results
    Then the results should reflect all applied filters and be sorted by mileage
    And the top result should have the option to be added to the user's wishlist
