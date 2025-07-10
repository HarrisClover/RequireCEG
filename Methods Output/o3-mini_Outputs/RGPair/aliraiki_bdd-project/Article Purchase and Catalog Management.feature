Feature: Article Purchase and Catalog Management
  As a user,
  I want to browse available articles, view product details, and purchase items
  So that I can manage my balance and complete transactions efficiently.

  # Scenario for buying articles and updating the balance
  Scenario: Purchase an article and update remaining balance
    Given a logged-in user with a current balance of "$500"
    And the catalog contains articles with prices within the user's available funds
    When the user clicks the "Buy" symbol for an article priced at "$150"
    And the system saves the purchased article to the user's bought items list
    Then the remaining balance should update to "$350"
    And the system should display a confirmation of the purchase
    And if the user attempts to purchase an item costing more than the remaining balance
    Then the system should display an error message "Insufficient funds for transaction"

  # Scenario for catalog display with affordability and pagination
  Scenario: Display available articles in the catalog with affordability and pagination
    Given the catalog contains more than 10 articles
    And each article has a listed price
    And the user has a current balance of "$200"
    When the catalog displays the articles
    Then only up to 10 articles per page should be shown
    And each displayed article should have a price less than or equal to "$200"
    And if no articles are affordable based on the user's current balance
    Then the system should notify the user "No items available within your budget"
    And if there are more than 10 affordable articles
    Then a PageContainer should be present to allow navigation between pages
    And the total number of available results should be clearly indicated

  # Scenario Outline for selecting quantity of articles and computing total price
  Scenario Outline: Select quantity and compute total price for purchase
    Given a product with a unit price of "<unit_price>"
    And the user selects a quantity of "<quantity>" for the purchase
    When the system computes the total price for the selected quantity
    Then the total price should be "<total_price>"
    Examples:
      | unit_price | quantity | total_price |
      | $15        | 1        | $15         |
      | $15        | 5        | $75         |
      | $15        | 10       | $150        |

  # Scenario for managing quantity bounds in the purchase selection
  Scenario: Restrict quantity selection within permissible bounds
    Given a product is available for purchase
    When the user attempts to set the quantity to "0"
    Then the system should prevent the selection and default to the minimum allowed quantity "1"
    When the user attempts to set the quantity to "11"
    Then the system should limit the selection to the maximum allowed quantity "10"

  # Scenario for displaying product information with description length constraint
  Scenario: Display product information with a concise description
    Given a product has a description of more than 50 characters
    When the product information page is rendered
    Then the description should be truncated to not exceed 50 characters
    And an ellipsis ("...") should be appended to indicate truncation
    And if the product description is 50 characters or fewer, it should be displayed in full without ellipsis

  # Scenario for validating pagination with total results overview
  Scenario: Validate pagination in catalog view
    Given the catalog has a total of "25" affordable articles for the user
    When the catalog is displayed
    Then the first page should show up to 10 articles
    And a PageContainer should allow navigation to subsequent pages
    And the overall total of "25" articles should be visible to the user
