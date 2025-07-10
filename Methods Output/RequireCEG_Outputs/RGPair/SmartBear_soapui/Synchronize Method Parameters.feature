Feature: Synchronize Method Parameters

  As a user managing mock services
  I want the system to automatically synchronize parameter updates across method and request levels
  So that I can ensure data integrity and consistency throughout the application

  Background:
    Given a user is logged in to the system
    And the user has mock services defined with parameters

  Scenario: Scenario 1: Editing existing parameter
    Given the user edits a method parameter to a new valid value
    And the parameter type is valid
    When the user saves the changes
    Then the corresponding request parameters are updated
    And data integrity and consistency are maintained across the application

  Scenario: Scenario 2: Resource-level parameter modification
    Given the user modifies parameters at the resource level
    When the user saves the resource
    Then the system synchronizes the method parameters and request view parameters successfully

  Scenario: Scenario 3: Adding a new resource
    Given the user adds a new resource with defined parameters
    When the resource is created
    Then the parameters synchronize with the mock responses at the sequence level

  Scenario: Scenario 4: Invalid data type error handling
    Given the user attempts to modify a parameter with an invalid data type
    When the user tries to save the changes
    Then an error message is presented to the user detailing the nature of the issue
    And specific instructions for rectifying the error are provided

  Scenario: Scenario 5: Parameter synchronization upon updates
    Given the user modifies a parameter at the method level to a new valid value
    When the user updates the resource
    Then the system synchronizes updates with the request parameters

  Scenario Outline: Scenario Outline: Synchronizing parameters upon updates
    Given the user modifies a parameter at the method level to <new-value>
    And the parameter type is <parameter-type>
    When the user updates the resource
    Then the system synchronizes with the request parameters
    Examples:
      | new-value | parameter-type |
      | 100 | Valid |
      | InvalidString | Invalid |
      | 50.5 | Valid |

