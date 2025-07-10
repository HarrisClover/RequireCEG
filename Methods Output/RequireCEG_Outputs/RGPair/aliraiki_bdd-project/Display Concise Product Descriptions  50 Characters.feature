Feature: Display Concise Product Descriptions (≤ 50 Characters)

  As a store owner
  I want to display product descriptions that are concise
  So that customers can quickly understand the products offered

  Background:
    Given the product descriptions may vary in length
    And the system must handle varying character counts

  Scenario: Display description within limits
    Given a product with description 'Stylish summer dress'
    When the product is displayed
    Then the description should be 'Stylish summer dress'
    And the description should not be truncated

  Scenario: Truncate long description
    Given a product with description 'This is an elegant evening gown that is perfect for various occasions'
    When the product is displayed
    Then the description should be 'This is an elegant evening g...' 
    And the description should be truncated to 50 characters

  Scenario: No products available
    Given there are no products in the catalog
    When the catalog is displayed
    Then the system should show a notification message 'There are currently no items you can afford.'

  Scenario Outline: Display scenarios for different product lengths
    Given a product with description '<description>'
    When the product is displayed
    Then the description should be '<expected-output>'
    Examples:
      | description | expected-output |
      | Short product | Short product |
      | An amazing product that helps you in daily tasks | An amazing product that helps yo... |
      | This description is exactly fifty characters long | This description is exactly fifty c... |

