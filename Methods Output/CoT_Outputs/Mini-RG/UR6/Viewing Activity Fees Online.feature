Feature: Viewing Activity Fees Online  
  As a user,  
  I want to view activity fees online,  
  So that I can easily create a bill statement or plan accordingly.

Scenario: View Activity Fees for Bill Statement  
  Given that I am planning to create a bill statement  
  When I request to view all available activity fees online  
  Then I should be able to view all activities fees online

Scenario: View Activity Fees When Not Creating a Bill Statement  
  Given that I am not planning to create a bill statement  
  When I request to view all available activity fees online  
  Then I should be able to view all activities fees online

Scenario: Unable to View Activity Fees if Network is Down  
  Given that the network is down  
  When I request to view all available activity fees online  
  Then I should not be able to view all activities fees online

Scenario: Unable to View Activity Fees if No Fees Are Available  
  Given that there are no activity fees online  
  When I request to view all available activity fees online  
  Then I should not be able to view any activity fees online
