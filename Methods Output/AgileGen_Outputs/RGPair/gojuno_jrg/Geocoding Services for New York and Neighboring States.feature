Feature: Geocoding Services for New York and Neighboring States
  As a user of the geocoding service,
  I want the system to return accurate city, county, and state information
  So that I can obtain correct location details based on geographic coordinates.

Scenario Outline: Successful geocoding request for a location
  Given the geocoding service is available
  And the specified coordinates are <latitude>, <longitude>
  When I submit a request for geocoding
  Then the system should return the corresponding city, county, and state
  And the response should include accurate administrative boundaries
  Examples:
    | latitude  | longitude |
    | 40.7128   | -74.0060  |
    | 42.3601   | -71.0589  |

Scenario Outline: Handling non-numeric inputs
  Given the geocoding service is available
  And the specified coordinates are "<latitude>", "<longitude>"
  When I submit a request for geocoding
  Then the system should return an error message "Invalid coordinates"
  And the system should return a status code of 400
  Examples:
    | latitude  | longitude |
    | "abc"     | -74.0060  |
    | 40.7128   | "xyz"     |

Scenario Outline: Handling edge cases with ambiguous locations
  Given the geocoding service is available
  And the specified coordinates are <latitude>, <longitude>
  When I submit a request for geocoding
  Then the system should return the most accurate location based on proximity to administrative boundaries
  And the system should categorize the response as "address" or "point of interest" based on the identified location
  Examples:
    | latitude  | longitude |
    | 40.748817 | -73.985428 | 

Scenario: Geocoding service under load
  Given the geocoding service is available
  When multiple geocoding requests are made concurrently
  Then the system should handle the load efficiently
  And maintain a response time within the targeted threshold for requests per second

Scenario Outline: Handling complex addressing scenarios
  Given the geocoding service is available
  And the specified coordinates are <latitude>, <longitude>
  When I submit a request for geocoding
  Then the system should return the correct address even if there are multiple potential matches or buildings without assigned addresses
  And the system should prioritize accurate administrative boundaries over points of interest
  Examples:
    | latitude  | longitude |
    | 40.748817 | -73.985428 |
    | 40.730610 | -73.935242 |

