Feature: Ensure Logical Navigation Across Sections

  As a user
  I want to access different sections of the application seamlessly
  So that I can obtain information and contact support easily

  Background:
    Given the user lands on the home page
    And the header menu contains navigable links

  Scenario: Scenario 1: Visit About Us section
    Given the user clicks on 'About Us'
    When the page loads
    Then the user should see subsections 'Who Are' and 'Where Are'
    And the user can click on 'Who Are' and see individual details

  Scenario: Scenario 2: Access Contact Us section
    Given the user clicks on 'Contact Us'
    When the contact form is displayed
    Then the user must complete email, name, and message fields

  Scenario: Scenario 3: Submit Contact Form Successfully
    Given the user fills in all required fields
    When the user submits the form
    Then the system displays a confirmation page with the submitted data

  Scenario: Scenario 4: Handle Incomplete Contact Form
    Given the user submits the contact form with incomplete fields
    Then the user receives a user-friendly error message indicating the incomplete fields

  Scenario: Scenario 5: Accessing Invalid Path
    Given the user attempts to access an invalid path
    Then the system presents a 'Not Found' page

  Scenario: Scenario 6: Check Home Page Navigation
    Given the user is on the home page
    When the user clicks on 'About Us'
    Then the user should be redirected to the 'About Us' page
    And the system enables intuitive navigation for seamless exploration

  Scenario Outline: Scenario Outline: Dynamic Links Access
    Given the user lands on the home page with <link>
    When the user clicks <link>
    Then the user should be redirected to the <destination>
    Examples:
      | link | destination |
      | About Us | about page |
      | Contact Us | contact form |
      | Invalid Link | Not Found page |

