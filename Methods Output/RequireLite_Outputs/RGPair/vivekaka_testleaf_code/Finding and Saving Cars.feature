Feature: Finding and Saving Cars

  As a user
  I want to search for used cars based on specific criteria
  So that I can find a suitable vehicle within my budget and save it for future reference

  Background:
    Given the user is on the Carwale website
    And the user navigates to the used cars section

  Scenario: Search for cars in Chennai
    Given the user selects Chennai as the city
    When the user enters a budget within the allowable range and searches for available vehicles
    Then the search results should display only cars within the specified budget
    And if no cars meet the criteria, an appropriate message should be displayed

  Scenario: Filter cars by specifications
    Given the user has searched for available vehicles
    When the user filters by selecting 'Hyundai Creta' as the manufacturer
    Then the search results should show only Hyundai Creta cars running on Petrol
    And if there are no matching results, a relevant notification should be presented

  Scenario: Add car to wishlist
    Given the search results display multiple vehicles
    When the user adds the car with the lowest mileage to their wishlist
    Then the car should be saved in the user's wishlist for future reference
    And the system should display a confirmation message indicating the car was successfully added

  Scenario: View car details in wishlist
    Given the user navigates to their wishlist
    When the user selects 'More Details' for the saved vehicle
    Then the system shall display all relevant information under the overview section

  Scenario: Close browser after browsing
    Given the user has completed their transactions or browsing activities
    When the user decides to close the browser
    Then the session should end without any errors
    And the user should be logged out to ensure their account security
