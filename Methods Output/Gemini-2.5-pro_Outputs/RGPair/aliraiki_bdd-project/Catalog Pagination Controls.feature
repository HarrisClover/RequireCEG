Feature: Catalog Pagination Controls
  As a user
  I want to navigate through multiple pages of catalog results and see the total count
  So that I can browse all available items efficiently when there are many.

  Scenario: Navigating between pages in the catalog
    Given the user has a balance of $1000
    And the system has 25 affordable items available for the user
    And the catalog displays 10 items per page
    When the user views the first page of the item catalog
    Then the user should see pagination controls (e.g., "Page 1 of 3", "Next")
    And the user should see an indicator of the total number of results (e.g., "Showing 1-10 of 25 items")
    When the user navigates to the next page
    Then the user should see the second page of items (items 11-20)
    And the pagination controls should update (e.g., "Page 2 of 3", "Previous", "Next")
    And the user should see an indicator of the total number of results (e.g., "Showing 11-20 of 25 items")