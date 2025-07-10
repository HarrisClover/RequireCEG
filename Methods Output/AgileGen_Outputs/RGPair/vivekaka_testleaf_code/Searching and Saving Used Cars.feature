Feature: Searching and Saving Used Cars
  As a user,
  I want to filter and view used cars based on specific criteria
  So that I can find a car that fits my budget and preferences

Scenario: Search for used cars and add to wishlist
  Given that the user is on the Carwale website
  When the user navigates to the used cars section
  And the user selects 'Chennai' as the city
  And the user sets the budget range between 8 lakhs and 12 lakhs
  And the user filters the cars to show only those with photos
  And the user selects 'Hyundai Creta' as the manufacturer
  And the user selects 'Petrol' as the fuel type
  And the user sorts the results by mileage from least to most
  Then the system should display a list of cars that match the criteria
  And the car with the lowest mileage should be displayed first
  When the user adds the car with the lowest mileage to their wishlist
  Then the system should save the car to the wishlist

Scenario: View details of saved car in wishlist
  Given that the user has added a car to their wishlist
  When the user navigates to their wishlist
  And the user selects 'More Details' for the saved vehicle
  Then the system should display all relevant information under the overview section

Scenario: Closing the browser
  Given that the user has completed their browsing or transaction activities
  When the user closes the browser
  Then the system should end the session
