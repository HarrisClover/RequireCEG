Feature: Product Store Catalog Management
As a store owner,
I want to efficiently manage products in my catalog,
So that I can easily add, update, delete, and search for products, ensuring seamless product management.

Scenario 1: Adding a New Product
Given that the store owner is logged into the system
When the store owner adds a new product with the following details:
| Name | Description | Price | Availability | Category | | T-Shirt | Cotton T-shirt | $20 | Available | Apparel |
Then the system should save the product with a unique ID
And the product should appear in the list of all available products
And the input fields should be cleared after creation
And a success message should be displayed confirming the product creation

Scenario 2: Updating a Product
Given that the store owner is logged into the system
And the store owner wants to update the details of an existing product
When the store owner updates the product’s name, price, or availability
Then the system should update the product’s details
And the updated product should reflect in the product list when searched
And the previous details should no longer appear in the search results

Scenario 3: Deleting a Product
Given that the store owner is logged into the system
And the store owner wants to delete an existing product
When the store owner deletes the product
Then the system should confirm the deletion
And the deleted product should no longer appear in the product list
And the system should show a success message confirming that the product was deleted

Scenario 4: Searching for a Product
Given that the store owner is logged into the system
When the store owner searches for a product by name, category, or availability
Then the system should return the correct products that match the search criteria
And the search results should include the product details such as name, price, and availability

Scenario 5: Listing All Available Products
Given that the store owner is logged into the system
When the store owner requests to view all available products
Then the system should display all available products in the product catalog
And the product details should include name, description, price, and availability status