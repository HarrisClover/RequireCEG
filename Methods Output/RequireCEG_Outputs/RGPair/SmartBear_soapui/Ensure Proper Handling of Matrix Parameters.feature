Feature: Ensure Proper Handling of Matrix Parameters

  As a system user
  I want to manage matrix parameters effectively
  So that I can filter and modify resources quickly without page refresh

  Background:
    Given the user is authenticated in the system
    And the resource list is loaded

  Scenario: Scenario 1: Adding a single matrix parameter
    Given the user adds a matrix parameter with value 'value1'
    When the user submits the request
    Then the system retrieves all resources matching 'value1'
    And displays the filtered resources to the user

  Scenario: Scenario 2: Adding a second matrix parameter
    Given the user has already added a matrix parameter with value 'value1'
    When the user adds another matrix parameter with value 'value2'
    Then the system filters resources based on both parameters
    And only relevant resources are shown

  Scenario: Scenario 3: Modifying a matrix parameter
    Given the user has several matrix parameters set
    When the user modifies one of the matrix parameters
    Then the system updates the request view without a page refresh
    And the resource editor reflects the changes immediately

  Scenario: Scenario 4: Removing a matrix parameter
    Given the user has added matrix parameters to the request
    When the user removes one of the matrix parameters
    Then the system dynamically updates the request view
    And all resources are filtered based on the remaining parameters

  Scenario: Scenario 5: Adding incompatible parameters
    Given the user attempts to add parameters 'valueA' and 'valueB' which are incompatible
    When the user submits the request
    Then the system displays an error message
    And clarifies the incompatibility issue to the user

  Scenario: Scenario 6: Storing valid parameters
    Given the user has set valid matrix parameters 'value1' and 'value2'
    When the user saves the request
    Then the system stores the parameters persistently for future reusability

  Scenario: Scenario 7: Adding incompatible parameters leading to an error
    Given the user attempts to add an incompatible matrix parameter with existing valid parameters
    When the user submits the request
    Then the system displays an appropriate error message to clarify the issue
