Feature: Show Section 'ORDER HISTORY AND DETAILS'

  As a logged-in user
  I want to view my order history and details
  So that I can track my purchases and manage my orders

  Background:
    Given the user is authenticated
    And the user navigates to the Accounts page

  Scenario: Scenario 1: User with past orders
    Given the user is logged into their account
    And the user's authentication status is successfully verified
    When the user views the 'ORDER HISTORY AND DETAILS' section
    Then the system displays the list of past orders
    And each order includes relevant status and details

  Scenario: Scenario 2: User with no past orders
    Given the user has no past orders in the system
    When the user views the 'ORDER HISTORY AND DETAILS' section
    Then the system presents a message 'No order history available.'

  Scenario: Scenario 3: User attempts to view order details without selecting an order
    Given the user is logged into their account
    When the user attempts to view details without selecting an order
    Then the system does not display any order details

  Scenario Outline: Scenario Outline: View order details
    Given the user has selected order <order-id>
    When the user requests to view details for that order
    Then the system fetches and displays the items purchased
    And the payment details including transaction ID and payment method
    And the shipping information including tracking numbers and delivery status
    Examples:
      | order-id | transaction-id | payment-method | tracking-number | delivery-status |
      | ORD123 | TX999 | Credit Card | TRACK456 | In Transit |
      | ORD456 | TX888 | PayPal | TRACK789 | Delivered |
      | ORD789 | TX777 | Debit Card | TRACK012 | Pending |

