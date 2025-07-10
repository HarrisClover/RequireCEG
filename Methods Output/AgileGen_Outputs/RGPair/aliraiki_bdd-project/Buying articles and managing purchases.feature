Feature: Buying articles and managing purchases
  As a customer,
  I want to buy articles from a catalog,
  So that I can add them to my basket, update my balance, and view relevant product details.

Scenario: Viewing available articles
  Given the system displays up to ten available articles per page
  And the user has a current balance
  When the user navigates to the article catalog
  Then only items that the user can afford are shown
  And the system should notify the user if no items are available

Scenario: Adding an item to the basket
  Given the user is logged into the system
  And the user is viewing an item from the catalog
  When the user clicks the Buy symbol
  Then the system should add the item to the basket
  And the system should update the remaining balance accordingly

Scenario: Adjusting the quantity of an item in the basket
  Given the user has added an item to their basket
  When the user adjusts the quantity of the item
  Then the quantity should be limited between 1 and 10
  And the total price should be updated accordingly

Scenario: Checking the total price of the basket
  Given the user has added items to their basket
  When the user views their basket
  Then the system should compute and display the total price based on the selected quantity of items

Scenario: Viewing product details
  Given the user is viewing a product
  When the user accesses the product’s information page
  Then the system should display a concise description of the product (up to 50 characters)
  And the system should truncate any description longer than 50 characters with an ellipsis

Scenario: Pagination of article catalog
  Given there are more articles than can fit on one page
  When the user navigates through the catalog pages
  Then the system should maintain an overview of the total number of results
  And the system should display the available pages for navigation
