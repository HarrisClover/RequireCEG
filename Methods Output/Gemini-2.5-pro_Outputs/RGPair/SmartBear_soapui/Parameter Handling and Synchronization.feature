Feature: Parameter Handling and Synchronization
  As a user,
  I want parameters to be synchronized across different levels (request, method, resource) and UI elements,
  So that I can manage and test request parameters efficiently and consistently.

  Scenario Outline: Add and synchronize parameters at different levels
    Given an existing REST Mock Service "Data API" with resource "/data"
    When the user adds a <ParameterType> parameter named "<ParamName>" with value "<ParamValue>" at the <Level> level for the "/data" resource
    Then the parameter "<ParamName>=<ParamValue>" should be visible in the <Level> editor for "/data"
    And the parameter "<ParamName>=<ParamValue>" should be reflected in the default request view for "/data"
    And the URI shown in the top bar for the request should correctly include the parameter based on its type and value

    Examples:
      | ParameterType   | ParamName   | ParamValue   | Level    |
      | query           | filter      | active       | resource |
      | matrix          | version     | 1.1          | resource |
      | query           | limit       | 20           | method   | # Assuming method level params are supported
      | query           | sort        | name         | request  | # Added/overridden in specific request view

  Scenario: Manipulate parameter value in request view
    Given a request view for "GET /data" in "Data API" showing the query parameter "filter=active" inherited from the resource level
    When the user changes the value of the "filter" parameter to "inactive" directly in the request view
    Then the request view should show "filter=inactive"
    And the URI in the top bar should update to include "?filter=inactive"
    And sending the request should use "filter=inactive"