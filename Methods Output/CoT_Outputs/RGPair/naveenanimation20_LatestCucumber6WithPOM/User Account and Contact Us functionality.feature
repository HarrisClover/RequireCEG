Feature: User Account and Contact Us functionality

  Scenario: Accessing the Accounts Page
    Given the user is logged into the system
    Then the page title should be "My account - My Store"
    And the following sections should be displayed:
      | ORDER HISTORY AND DETAILS |
      | MY CREDIT SLIPS            |
      | MY ADDRESSES               |
      | MY PERSONAL INFORMATION    |
      | MY WISHLISTS               |
      | Home                       |

  Scenario: Contact Us page form submission
    Given the user is on the "Contact Us" page
    When the user fills out the form with relevant data
    And submits the form
    Then the system should display "Your message has been sent to the team."

  Scenario: Logging into the system
    Given the user is on the "Login - My Store" page
    And the page contains the "Forgot your password?" link
    When the user enters the username "dec2020secondbatch@gmail.com" and the password "Selenium@12345"
    Then the user should be redirected to the "My account - My Store" page
