Feature: Displaying Special Waste Drop-Off Sites on a Map
  As a user,
  I want to view a map display of special waste drop-off sites around my area
  So that I know where to drop off my special waste

Scenario: Viewing special waste drop-off sites on the map
  Given that the GPS is working correctly
  And there is an active internet connection
  When I open the special waste map
  Then I should see the special waste drop-off sites available in my area

Scenario: Not viewing special waste drop-off sites when there are none available
  Given that the GPS is working correctly
  And there is an active internet connection
  When I open the special waste map
  Then I should not see any special waste drop-off sites on the map

Scenario: Not viewing special waste drop-off sites if the GPS is not working
  Given that the GPS is not working
  And there is an active internet connection
  When I open the special waste map
  Then I should not see any special waste drop-off sites on the map

Scenario: Not viewing special waste drop-off sites if there is no internet connection
  Given that the GPS is working correctly
  And there is no internet connection
  When I open the special waste map
  Then I should not see any special waste drop-off sites on the map
