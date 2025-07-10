Feature: Implement PageContainer for Results Navigation

  As a store owner
  I want to manage the display of items available for purchase and navigate through them effectively
  So that customers can easily browse items within their budget

  Background:
    Given the user is logged into the system
    And there are items available in the user's catalog

  Scenario: Scenario 1: Displaying items when there are more than ten
    Given the total number of items in the catalog exceeds ten
    When the user accesses the catalog
    Then the system should display only ten items
    And pagination buttons should be available

  Scenario: Scenario 2: Navigating to the next page
    Given the user is on the first page of the items
    When the user clicks on the next page button
    Then the system should load the next set of ten items
    And the total count of items available remains unchanged

  Scenario: Scenario 3: No items available for purchase
    Given the user's current balance does not allow for article purchases
    When the user accesses their catalog
    Then the system should display a message stating that no items are available for purchase

  Scenario: Scenario 4: Selecting too many items
    Given the user attempts to select a quantity of items greater than ten
    When the user confirms the selection
    Then the system should automatically adjust the selection back to a maximum of ten

  Scenario: Scenario 5: Navigating beyond the last page
    Given the user is on the last page of items
    When the user clicks on the next page button
    Then the system should display a message indicating they are already on the last page

  Scenario: Scenario 6: Navigating back to the previous page
    Given the user is on a page displaying items
    When the user navigates back to the previous page
    Then the displayed items should refresh to reflect current pricing according to the user’s updated available balance

  Scenario: Scenario 7: When user has ten or fewer articles
    Given the total number of articles in the user's catalog is ten or fewer
    When the user accesses the catalog
    Then the system should display all available items
