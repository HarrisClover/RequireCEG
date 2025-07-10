Feature: Expand Dynamic Properties in Responses

  As a system user
  I want the API to return user-specific dynamic properties based on request parameters
  So that I can receive tailored information and access based on my user type and region

  Background:
    Given the system is accessible
    And the user has valid request parameters

  Scenario: Admin User Request in North America
    Given the 'userType' parameter is set to 'admin'
    And the request includes a 'region' parameter set to 'NA'
    And the request includes 'dynamicFlag' set to true
    When the user sends a GET request to the API
    Then the API response should include 'permissions' and 'role'
    And the response should include 'welcomeMessage' with 'Welcome to North America!'
    And the response should include 'specialOffer' field

  Scenario: Guest User Request in Europe
    Given the 'userType' parameter is set to 'guest'
    And the request includes a 'region' parameter set to 'EU'
    And the request includes 'dynamicFlag' set to false
    When the user sends a GET request to the API
    Then the API response should include 'accessLevel' and 'expiration'
    And the response should not contain 'permissions' and 'role'
    And the response should include 'welcomeMessage' with 'Welcome to Europe!'

  Scenario: Guest User Request in North America with Dynamic Flag True
    Given the 'userType' parameter is set to 'guest'
    And the request includes a 'region' parameter set to 'NA'
    And the request includes 'dynamicFlag' set to true
    When the user sends a GET request to the API
    Then the API response should include 'accessLevel' and 'expiration'
    And the response should include 'welcomeMessage'
    And the response should include 'specialOffer' field

  Scenario: Admin User Request in Europe
    Given the 'userType' parameter is set to 'admin'
    And the request includes a 'region' parameter set to 'EU'
    And the request includes 'dynamicFlag' set to false
    When the user sends a GET request to the API
    Then the API response should include 'permissions' and 'role'
    And the response should include 'welcomeMessage' with 'Welcome to Europe!'

  Scenario Outline: Scenario Outline: Dynamic Flag Handling
    Given the 'userType' parameter is set to '<userType>'
    And the request includes 'region' set to '<region>'
    When the user sends a GET request with 'dynamicFlag' set to '<dynamicFlag>'
    Then the API response should include '<expectedFields>'
    Examples:
      | userType | region | dynamicFlag | expectedFields |
      | admin | NA | True | permissions, role, welcomeMessage, specialOffer |
      | guest | EU | False | accessLevel, expiration, welcomeMessage |
      | admin | EU | False | permissions, role, welcomeMessage |
      | guest | NA | True | accessLevel, expiration, welcomeMessage, specialOffer |

