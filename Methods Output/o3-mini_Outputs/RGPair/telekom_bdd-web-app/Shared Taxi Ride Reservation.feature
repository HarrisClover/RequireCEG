Feature: Shared Taxi Ride Reservation  
As a logged in user, I want to make a reservation for a collective taxi ride so that I can share costs with others.

  Scenario: Successful Reservation with Available Offers  
    Given the user is logged in  
    And there is an available taxi ride offer for the desired time period  
    When the user selects the taxi ride option and specifies the number of passengers  
    And the user confirms the reservation  
    Then the system calculates the ticket price in real time based on the number of passengers and the specified time period  
    And the system creates the reservation successfully  

  Scenario: Reservation Attempt When No Offers Are Available  
    Given the user is logged in  
    And there are no available taxi ride offers for the selected time period  
    When the user attempts to make a reservation  
    Then the system prevents the reservation  
    And the system displays a message indicating that no offers are available for the selected time  

  Scenario: Reservation Process with JavaScript Disabled  
    Given the user is logged in with JavaScript disabled in the browser  
    And the user navigates to the taxi reservation page  
    When the user attempts to make a reservation  
    Then the system detects the absence of JavaScript functionality  
    And the system displays an appropriate fallback message indicating that certain interactive features may be limited or unavailable  
    And the user is provided with instructions on how to proceed to ensure a smooth reservation process  

