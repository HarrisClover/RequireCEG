Feature: Set Budget Range Filter

  As a car buyer
  I want to search for used cars within a specified budget range in Chennai
  So that I can find suitable vehicles that meet my financial criteria

  Background:
    Given the user has selected 'Chennai' as the city
    And the user has logged into the system

  Scenario: Scenario 1: Display used cars within budget
    Given the user specifies a budget range between 8 lakhs and 12 lakhs
    When the user initiates a search for used cars
    Then the system should display only used cars that fall within this budget
    And the cars should be relevant to the city of Chennai

  Scenario: Scenario 2: Display all used cars when no budget is set
    Given the user does not define a budget range
    When the user initiates a search for used cars
    Then the system should display all used cars available in Chennai

  Scenario: Scenario 3: Filter by specific car model, fuel type, and ensure photo availability
    Given the user specifies a budget range between 8 lakhs and 12 lakhs
    And the user applies filters for 'Hyundai Creta' and 'Petrol'
    And the user selects 'only cars with photos'
    When the user initiates a search for used cars
    Then the system should display only those used Hyundai Creta cars running on petrol within the budget range
    And the results should be sorted by mileage from least to most
    And the results should include only cars that have photos

  Scenario: Scenario 4: Reject cars without photos
    Given the user has selected filters including 'only cars with photos'
    When the user initiates a search for used cars
    Then the system should filter out any used cars that do not include photos in the listing
