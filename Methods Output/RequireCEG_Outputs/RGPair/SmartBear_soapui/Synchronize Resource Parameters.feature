Feature: Synchronize Resource Parameters

  As a user managing mock services
  I want to automatically update parameters across request and resource levels
  So that I ensure consistency and accuracy in my service configurations

  Background:
    Given the dynamic property expansion feature is enabled
    And a user is editing a REST or SOAP Mock service

  Scenario: Scenario 1: Update parameter value
    Given a user modifies a parameter value in the request editor
    And there are related descriptions in the resource editor
    When the parameter value is saved
    Then the corresponding parameter details in the resource editor are updated
    And all requests utilizing that resource reflect the new parameter details

  Scenario: Scenario 2: Change data type
    Given a user changes the data type of a parameter in the request editor
    When the change is confirmed
    Then the data type in the resource editor is synchronized

  Scenario: Scenario 3: Set a query parameter
    Given a user sets a query parameter in the request view
    And a corresponding matrix parameter exists in the resource editor
    When the user saves the query parameter
    Then the associated matrix parameter in the resource editor is updated

  Scenario: Scenario 4: Synchronization of parameters
    Given a user modifies parameters at the request level
    When the changes are saved
    Then the system automatically updates corresponding parameters at the method level
    And the system automatically updates corresponding parameters at the resource level

  Scenario: Scenario 5: Data type validation
    Given the request parameter value is changed
    When the parameter is saved
    Then the system ensures that all requests utilizing that resource reflect the new parameter details
    And the request parameter data type is modified

  Scenario: Scenario 6: Requirement check
    Given the dynamic property expansion feature is enabled
    And the request parameter value is changed
    When the user performs an operation that requires changes to dynamic properties
    Then the system triggers an immediate update of the expanded properties across all relevant application layers
    And the system updates the top URI bar to eliminate confusion or discrepancies in data management
