Feature: Synchronize Request Parameters

  As a system administrator
  I want to ensure that request parameters synchronize automatically across all levels
  So that data integrity is maintained throughout the system

  Background:
    Given the system supports dynamic property synchronization
    And all request parameters are linked correctly

  Scenario: Parameter Update at Resource Level
    Given a request parameter is updated at the resource level
    When the user updates the request parameter
    Then the corresponding mock responses are updated automatically
    And the changes reflect throughout the system

  Scenario: Dynamic Property Synchronization
    Given a dynamic property is set in the request
    When the user updates the request parameter
    Then the automatic synchronization process initiates for the parameters at both the request and method levels

  Scenario: Matrix Parameter Modification
    Given a user modifies a matrix parameter
    When the system adjusts the associated query parameters
    Then coherence and relevance in data relationships is maintained

  Scenario: Parameter Deletion
    Given a parameter is deleted from the resource level
    When the system removes the deleted parameter
    Then the parameter is deleted from all linked requests and responses

  Scenario: Discrepancy Notification
    Given the synchronization process detects discrepancies during updates
    When the user is notified of the conflict
    Then suggested resolutions are provided for a seamless integration experience

  Scenario Outline: Scenario Outline: Request Parameter Synchronization
    Given a dynamic property is set to <property-value>
    And matrix parameter count is <matrix-count>
    When the user updates <parameter-name>
    Then the system synchronizes the changes across <related-parameters>
    Examples:
      | property-value | matrix-count | parameter-name | related-parameters |
      | high | 2 | discount-rate | total, discount |
      | low | 3 | shipping-cost | total, taxes |

