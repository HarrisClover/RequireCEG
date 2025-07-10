Feature: Add Car to Wishlist

  As a user searching for cars
  I want to add the car with the lowest mileage to my wishlist
  So that I can easily access it for future reference

  Background:
    Given there is a car with the lowest mileage in the search results
    And the user is logged into the system

  Scenario: Add to Wishlist Successfully
    Given the user sees the car with the lowest mileage
    When the user clicks 'Add to Wishlist'
    Then the system should display a message 'Car successfully added to your wishlist for future reference'
    And the car details should be saved in the user's wishlist section for easy access later

  Scenario: Car Not Found
    Given the user is on the search results page
    When the user searches for a car with the lowest mileage but none exists
    Then the system should display a message 'No cars available with the lowest mileage'

  Scenario: Confirm Car Addition to Wishlist
    Given there is a car with the lowest mileage in the search results
    When the user clicks 'Add to Wishlist'
    Then a confirmation message is displayed: 'Car successfully added to your wishlist for future reference'

  Scenario: Car Details Saved Successfully
    Given there is a car with the lowest mileage in the search results
    When the user clicks 'Add to Wishlist'
    Then the car details are saved in the user's wishlist section for easy access later
