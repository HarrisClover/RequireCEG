Feature: Reflect User Actions in Top URI Bar

  As a user
  I want the top URI bar to dynamically reflect the selected resource's URI and any modifications made
  So that I have real-time visual feedback on the current request context

  Background:
    Given the user is logged into the system
    And the initial URI is set to the default resource location

  Scenario: Scenario 1: Update URI on resource selection
    Given a resource 'Products' is selected
    When the user selects the resource
    Then the URI bar should display the URI for 'Products'
    And the URI reflects the selection instantly

  Scenario: Scenario 2: Update URI on method change
    Given the current request method is GET
    When the user modifies the request method to POST
    Then the URI bar should automatically update to represent the change in request method
    And it shows the correct request format for POST

  Scenario: Scenario 3: Add query parameter to URI
    Given the current URI is '/api/products'
    When the user adds a query parameter 'sort=asc'
    Then the URI bar should display '/api/products?sort=asc'
    And the query parameter is concatenated correctly

  Scenario: Scenario 4: Remove query parameter from URI
    Given the current URI is '/api/products?sort=asc'
    When the user removes the 'sort' query parameter
    Then the URI bar should reflect '/api/products'
    And the corresponding segment has been removed without causing any errors

  Scenario: Scenario 5: Update URI with new access token
    Given the current URI is '/api/users'
    When the user modifies the OAuth token settings
    Then the URI bar should display '/api/users?access_token=...'
    And the authentication parameters are shown correctly

  Scenario: Scenario 6: Refresh existing access token
    Given the current URI is '/api/users?access_token=old_token'
    When the user refreshes the existing access token
    Then the URI bar should display '/api/users?access_token=new_token'
    And the URI reflects the refresh of the existing access token correctly

  Scenario: Scenario 7: Delete query parameter from URI
    Given the current URI is '/api/products?filter=none&sort=asc'
    When the user deletes the 'filter' query parameter
    Then the URI bar should display '/api/products?sort=asc'
    And the removed query parameter does not cause any formatting errors
