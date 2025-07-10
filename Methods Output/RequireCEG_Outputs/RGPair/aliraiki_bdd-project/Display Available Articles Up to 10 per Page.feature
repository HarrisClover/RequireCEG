Feature: Display Available Articles (Up to 10 per Page)

  As a store customer
  I want to view only the items I can afford, up to 10 items per page
  So that I can make informed purchasing decisions without feeling overwhelmed

  Background:
    Given the user has a current balance
    And there are available articles to purchase

  Scenario: Scenario 1: Displaying affordable items
    Given the user's balance is sufficient to purchase at least one item
    When the user requests to view items for purchase
    Then the system should display only the items the user can afford
    And the displayed items should be limited to a maximum of 10 per page

  Scenario: Scenario 2: No affordable items
    Given the user's balance is insufficient for any items
    When the user requests to view items for purchase
    Then the system should display a message stating that no items are available for purchase

  Scenario: Scenario 3: Selecting quantity outside permissible limits
    Given the user wants to purchase an item
    When the user selects a quantity greater than 10
    Then the system should display a warning message prompting the user to adjust their selection

  Scenario: Scenario 4: Quantity selection within permissible limits
    Given the user wants to purchase an item
    When the user selects a quantity between 1 and 10
    Then the system should allow the purchase

  Scenario Outline: Scenario Outline: Pagination of available articles
    Given there are <total-articles> articles available for purchase
    And the user is on page <current-page>
    When the user requests to view articles
    Then the system should display <displayed-articles> articles on the current page
    Examples:
      | total-articles | current-page | displayed-articles |
      | 15 | 1 | 10 |
      | 15 | 2 | 5 |
      | 22 | 1 | 10 |
      | 22 | 3 | 10 |

