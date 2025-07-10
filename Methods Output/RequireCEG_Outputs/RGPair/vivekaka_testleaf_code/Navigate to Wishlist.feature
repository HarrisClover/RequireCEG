Feature: User Data Management

  As a user
  I want to ensure my data is saved before closing the browser
  So that I can exit the system smoothly without losing any information

  Background:
    Given the user has items in their wishlist or has completed a transaction
    And the user is logged into the system

  Scenario: Scenario 1: User closes the browser after reviewing wishlist
    Given the user opens their wishlist
    And the user reviews the items in the wishlist
    When the user decides to close the browser
    Then all user data should be saved properly
    And the session should end without any disruptions

  Scenario: Scenario 2: User closes the browser after completing a transaction
    Given the user completes a purchase
    When the user decides to close the browser
    Then all user data should be saved properly
    And the session should end without any disruptions

  Scenario: Scenario 3: User closes browser without disruptions and without completed session
    Given the user initiates the closing of the browser
    And all user data is saved properly
    When the session is closed without disruptions
    Then a confirmation message that the session has ended should be displayed

  Scenario: Scenario 4: User attempts to close the browser while session is disrupted
    Given the user tries to close the browser
    When the session is closed without disruptions
    Then the session should terminate securely
