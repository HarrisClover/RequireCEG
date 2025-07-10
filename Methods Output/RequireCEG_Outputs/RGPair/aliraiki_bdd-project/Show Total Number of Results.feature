Feature: Show Total Number of Results

  As a store owner
  I want to display the total number of results when articles exceed a threshold
  So that customers can see how many items are available for purchase

  Background:
    Given a customer is logged into their account
    And the catalog contains more than 10 articles

  Scenario: Customer can see the total number of results
    Given the customer's account balance is sufficient to purchase at least one article
    When the customer views the catalog page
    Then the system displays the total number of results at the top of the catalog page
    And the maximum number of items the customer can purchase is calculated

  Scenario: Customer insufficient funds
    Given the customer's account balance is not enough to purchase any articles
    When the customer views the catalog page
    Then the system displays a message stating that no items are available for purchase
    And the system records the event for analytics

  Scenario: Pagination for multiple articles
    Given there are more articles available than can fit on one page
    When the customer navigates through the pages
    Then the system enables pagination and consistently displays the total number of results
    And the customer can navigate between pages without losing the displayed information

  Scenario: Updating items in the cart affects results
    Given the customer has modified the quantity of articles in their cart
    When the customer views the updated cart
    Then the system recalculates the total number of results
    And updates the displayed information accordingly

  Scenario: Unable to purchase any articles
    Given the customer's account balance is not sufficient to purchase any articles
    When the customer views the catalog page
    Then the system informs the user that no items can be purchased, indicating insufficient funds
