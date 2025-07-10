Feature: Provide 'Where Are' Subsection with Location Details

  As a user
  I want to view detailed locations associated with the organization
  So that I can easily find information about those locations

  Background:
    Given the user is on the 'About Us' section
    And the user selects the 'Where Are' subsection

  Scenario: Display map with location pins
    Given the user has accessed the map
    When the map renders
    Then all relevant locations should be highlighted on the map
    And the system should render the detailed map with highlighted locations

  Scenario: Popup details when clicking a location pin
    Given the map has location pins displayed
    When the user clicks on a location pin
    Then a popup should appear with the corresponding address and brief description
    And the system should display a popup with the address and description of the selected location

  Scenario: Real-time search filtering of locations
    Given the user sees the location search bar
    When the user enters a query in the search bar
    Then the displayed locations should filter and update in real-time based on the input text
    And the system should filter the displayed locations and show only matching results

  Scenario: No results found message
    Given the user enters a query that matches no locations
    When the search completes
    Then a friendly message stating 'No locations found for your query, please try another one.' should be displayed
    And the system should present a friendly message stating 'No locations found for your query, please try another one.'

  Scenario: Redirecting to detailed location page
    Given the user has opened the location popup
    When the user clicks on a specific location within the popup
    Then the user should be redirected to a dedicated page containing detailed information about that location
    And the system should redirect the user to a dedicated page containing detailed information about the selected location

  Scenario: Checking if map displays correctly
    Given the user accesses the 'Where Are' subsection
    When the user has navigated to the map
    Then the system should render the detailed map with highlighted locations

  Scenario: Ensuring no search results logic
    Given the user enters a query that returns no results
    When the search is performed
    Then the system should not display the location popup
    And the system should show the message 'No locations found for your query, please try another one.'
