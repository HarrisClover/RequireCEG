Feature: Update Environment

  As a system administrator
  I want to update an environment in a specified cluster
  So that I can ensure the environment is configured correctly

  Background:
    Given an environment exists in the specified cluster
    And the user is authenticated

  Scenario: Environment update with valid details
    Given the environment name is in the correct format
    And all properties are supported
    When the user updates the environment
    Then the environment should be updated successfully
    And a confirmation message is displayed

  Scenario: Environment update with invalid name format
    Given the environment name is in an incorrect format
    When the user attempts to update the environment
    Then a validation error is returned indicating the name format issue

  Scenario: Update non-existing environment
    Given the environment does not exist in the specified cluster
    When the user attempts to update the environment
    Then a message indicating that the environment does not exist will be returned

  Scenario: Update environment in a different cluster
    Given the environment is located in a different cluster
    When the user attempts to update the environment
    Then an error message is returned stating that updates may only be performed on the specified cluster's environments

  Scenario Outline: Scenario Outline: Update status with various properties
    Given the environment name is in the correct format
    And the user attempts to update with <property>
    When the user submits the update request
    Then the system checks the <validation>
    Examples:
      | property | validation |
      | valid property | update is successful |
      | unsupported property | a validation error is returned |
      | incorrect format | a validation error is returned |

