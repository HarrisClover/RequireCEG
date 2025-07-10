Feature: Used Cars Search and Wishlist Management  
  As a potential buyer,  
  I want to search for used cars with specific filters and manage my wishlist  
  So that I can easily review and compare vehicles that meet my criteria  

Scenario: Search for a car and add the one with the lowest mileage to the wishlist  
  Given the user accesses the Carwale website and navigates to the used cars section  
  And the user selects "Chennai" as the city  
  And the user sets the budget range from "8 lakhs" to "12 lakhs"  
  And the user applies the filter to view only available vehicles  
  And the user selects to view only cars with photos  
  And the user filters the results by manufacturer "Hyundai Creta" and fuel type "Petrol"  
  When the user initiates the car search  
  Then the system displays the search results sorted by mileage from least to most  
  And the car with the lowest mileage is identifiable among the results  

Scenario: View car details from the wishlist  
  Given the user has added the car with the lowest mileage to the wishlist  
  When the user navigates to the wishlist  
  And the user selects "More Details" for the saved vehicle  
  Then the system displays all relevant vehicle information under the overview section  

Scenario: Close the browser after the transaction  
  Given the user has completed all browsing and wishlist activities  
  When the user decides to end the session  
  Then the application allows the user to close the browser successfully