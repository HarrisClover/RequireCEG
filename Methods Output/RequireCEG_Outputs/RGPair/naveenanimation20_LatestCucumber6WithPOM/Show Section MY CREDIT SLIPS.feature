Feature: Show Section 'MY CREDIT SLIPS'

  As a logged-in user
  I want to view my credit slips
  So that I can keep track of my available credits

  Background:
    Given the user is logged into their account
    And the user navigates to the Accounts page

  Scenario: Scenario 1: Credit slips are available
    Given the section 'MY CREDIT SLIPS' is present under 'My account - My Store'
    When credit slips are available
    Then the system retrieves and displays the list of credit slips
    And each credit slip shows the date issued and the associated amount

  Scenario: Scenario 2: No credit slips available
    Given the section 'MY CREDIT SLIPS' is present under 'My account - My Store'
    When no credit slips are available
    Then the system displays the message 'No credit slips available'

  Scenario: Scenario 3: User not logged in
    Given the user is not logged into their account
    When the user navigates to the Accounts page
    Then the system redirects the user to the Login page
    And the title 'Login - My Store' is displayed along with the 'Forgot your password?' link

  Scenario: Scenario 4: User has not logged in and navigates to Accounts page
    Given the user is not logged into their account
    When the user attempts to access the Accounts page
    Then the system automatically redirects the user to the Login page
    And the title 'Login - My Store' is displayed
