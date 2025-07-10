Feature: Geocoding Services for New York and Neighboring States

As a user of the geocoding service, I want the system to accurately translate geographic coordinates into detailed location information (city, county, state) for defined areas while handling errors and edge cases appropriately.

Scenario: Retrieve valid geocoding details for a known location
Given the system receives valid numeric coordinates within New York or a neighboring state
When the user requests geocoding information
Then the system should return the corresponding city, county, and state information
And the response type should be clearly categorized (e.g., address, building, or point of interest)

Scenario: Handle non-numeric coordinate inputs
Given the system receives non-numeric or improperly formatted coordinate inputs
When the user requests geocoding information
Then the system should return an appropriate error message
And a status code indicating a bad request

Scenario: Prioritize proper addresses over points of interest
Given that the provided coordinates fall in an area with both a valid administrative address and nearby points of interest
When the user requests geocoding information
Then the system should select and return the proper administrative address
And factor in proximity to ensure accuracy

Scenario: Process requests under high load conditions
Given the system is processing a high number of geocoding requests per second
When requests are made both with and without administrative data
Then the system should maintain the targeted performance thresholds
And deliver responses within the defined acceptable response times

Scenario: Handle complex addressing scenarios with multiple potential matches
Given that the coordinates correspond to a location with overlapping geographical contexts (e.g., a building without a specific assigned address or close to other structures)
When the user requests geocoding information
Then the system should analyze the context and return the correct address
And the response should clearly categorize the result (as a building, an address, or a point of interest)
And any ambiguities should be resolved by considering administrative boundaries and proximity