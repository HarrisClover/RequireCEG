Feature: Implementation of Aggregate Functions

  As a user
  I want to compute totals, averages, and counts of nodes based on specific criteria
  So that I can retrieve meaningful insights from the data effectively

  Background:
    Given the system contains a dataset of nodes with various properties
    And the user is authenticated to perform operations on the dataset

  Scenario: Count nodes by label
    Given the user requests the total count of nodes with the label 'Product'
    Then the system returns the total count of nodes matching the label
    And if no nodes are found, a message indicating that no nodes were found is displayed

  Scenario: Filter nodes by property
    Given the user requests the count of nodes with the label 'Product' and a price greater than $50
    Then the system returns the count of nodes that meet both conditions

  Scenario: Compute average property across nodes
    Given the user requests the average price of nodes with the label 'Product'
    Then the system computes and returns the average of the specified numerical property

  Scenario: Aggregate average with related property condition
    Given the user requests the average rating of 'Product' nodes whose price is less than $150 and category is 'Accessory'
    Then the system returns the average rating of qualifying nodes

  Scenario: Sum property for specific relationship type
    Given the user requests the total revenue from all 'Sales' relationships of 'Product' nodes
    Then the system returns the summed revenue value

  Scenario: Handle unique constraint violation
    Given the user attempts to add a node that violates unique constraints
    Then the system displays an error message clearly stating the unique constraint violation conflict

  Scenario: Syntactic error in query
    Given the user submits a query with a typo in the property name
    Then the system provides a detailed error message with corrective suggestions for refining the user's query

  Scenario: Filter and Count Nodes
    Given the user requests the count of nodes with the label '<label>'
    And the property '<property>' with a value <value>
    When the system processes the request
    Then the count of nodes that meet the criteria should be <count>
