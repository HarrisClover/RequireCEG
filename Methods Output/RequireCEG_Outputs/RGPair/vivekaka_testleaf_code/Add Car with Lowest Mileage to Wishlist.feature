Feature: Add Car with Lowest Mileage to Wishlist

  As a car shopper
  I want my wishlist to save my vehicle preferences
  So that I can easily return to my saved vehicles after closing the browser

  Background:
    Given the user has added vehicles to their wishlist
    And the user closes the browser

  Scenario: Scenario 1: Returning to the Wishlist
    Given the user has previously saved vehicles in the wishlist
    When the user returns to the site
    Then the wishlist should contain all previously saved vehicles
    And the user can view and manage those vehicles

  Scenario: Scenario 2: Browser Session Ends
    Given the user has saved vehicles in the wishlist
    When the browser session ends
    Then the saved vehicles remain in the wishlist after reopening the site

  Scenario: Scenario 3: Data Persistence upon Closure
    Given the user has vehicles in their wishlist
    When the user closes the browser
    Then the system saves the wishlist information
    And the wishlist data is stored persistently

  Scenario: Scenario 4: Wishlist Retrieval
    Given the user has previously saved vehicles in the wishlist
    When the user returns to the site later
    Then the system retrieves the previously saved wishlist
    And the user's wishlist is displayed with previously saved vehicles

  Scenario: Scenario 5: Mutual Exclusion of Actions
    Given the user has a wishlist with vehicles
    When the user deletes a vehicle from the wishlist
    Then the vehicle must not appear in the wishlist again
    And the user cannot view that vehicle in their saved vehicles

  Scenario Outline: Scenario Outline: Persisting Wishlist Data
    Given the wishlist contains <number> vehicles
    And the user closes the browser
    When the user returns to the site
    Then the wishlist should still contain <number> vehicles
    Examples:
      | number |
      | 1 |
      | 5 |
      | 10 |

