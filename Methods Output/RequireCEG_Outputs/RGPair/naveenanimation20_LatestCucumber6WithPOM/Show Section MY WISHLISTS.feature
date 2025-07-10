Feature: Show Section 'MY WISH LISTS'

  As a registered user
  I want to access and manage my wishlists
  So that I can organize items I wish to purchase later

  Background:
    Given the user is on the login page
    And the user enters valid login credentials

  Scenario: Scenario 1: Accessing MY WISH LISTS after login
    Given the user is logged into their account
    When the user navigates to the Accounts page
    Then the 'MY WISH LISTS' section should be displayed
    And the system should check for existing wishlists

  Scenario: Scenario 2: User has existing wishlists
    Given the user has created wishlists
    When the user views the wishlists
    Then the system should list all existing wishlists
    And each wishlist should have options for viewing and deleting items

  Scenario: Scenario 3: No wishlists exist for the user
    Given the user has not created any wishlists
    When the user checks the MY WISH LISTS section
    Then the system should display the message 'No wishlists have been created yet.'

  Scenario: Scenario 4: Unauthenticated user attempts to access MY WISH LISTS
    Given the user is not logged into their account
    When the user tries to navigate to the Accounts page
    Then the system should redirect the user to the login page

  Scenario: Scenario 5: Adding item to my wishlist
    Given the user is logged in and viewing the MY WISH LISTS section
    When the user clicks on 'Add to Wishlist'
    Then an input form should appear for adding a new wishlist item
    And the user enters details for the item
    And submits the form successfully
    Then the item should be added to MY WISH LISTS
    And the system should present a confirmation message
