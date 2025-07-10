Feature: Managing Product Catalog
As a Product Store Owner,
I want to manage the product catalog through a web interface,
So that I can efficiently update product details and manage product availability.

Scenarios:
Scenario 1: Display the product catalog administration page
Given the product store service is available
When I visit the home page of the catalog service
Then I should see a page titled "Product Catalog Administration"
And the page should be accessible without a "404 Not Found" error

Scenario 2: Create a new product
Given I am logged into the system as a Product Store Owner
And I am on the product creation page
When I enter product details such as name, description, availability status, category, and price
And I press the "Create Product" button
Then the product should be created successfully
And I should see a "Success" message confirming the creation of the product
And all input fields should be cleared

Scenario 3: Retrieve a product by its unique ID
Given I am logged into the system as a Product Store Owner
When I enter the unique product ID in the "Retrieve Product" field
And I press the "Retrieve" button
Then the system should retrieve and display the product details
And the product's name, description, availability status, category, and price should be accurately displayed in the respective fields