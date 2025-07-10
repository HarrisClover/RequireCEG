Feature: Seamless User Experience and Navigation
  As a user,
  I want to have a smooth and logical navigation experience
  So that I can easily explore various sections and understand the content

Scenario: Navigate to the Home Page
  Given the application is started
  When the user accesses the application
  Then the user should see a home page with headers, footers, and menus
  And the user should be able to navigate to the following sections:
    | About Us | Contact Us | Error Pages |

Scenario: Access the About Us Page
  Given the user is on the home page
  When the user clicks on the 'About Us' link
  Then the user should be directed to the About Us page
  And the About Us page should contain links to the subsections 'Who Are' and 'Where Are'

Scenario: Access the Contact Us Page
  Given the user is on the home page
  When the user clicks on the 'Contact Us' link
  Then the user should be directed to the Contact Us page
  And the Contact Us page should contain a form with the following fields:
    | Email | Name | Message |

Scenario: Submit Contact Us Form with Valid Data
  Given the user is on the Contact Us page
  And the user has entered valid information in the form
  When the user submits the form
  Then the user should be directed to a confirmation page
  And the confirmation page should display the submitted data and a thank you message

Scenario: Submit Contact Us Form with Missing Required Fields
  Given the user is on the Contact Us page
  And the user has not filled all required fields
  When the user attempts to submit the form
  Then the user should receive a validation message indicating the missing required fields
  And the form should not be submitted

Scenario: Encountering an Error
  Given the user navigates to a non-existent page
  When the user tries to access the page
  Then the user should be shown an error page
  And the error page should provide meaningful feedback to the user

Scenario: Navigating to Invalid Path
  Given the user attempts to access an invalid path
  When the user tries to navigate to that path
  Then the user should be shown a consistent 'Not Found' page
  And the Not Found page should provide clear instructions to the user

Scenario: Navigating Between Sections
  Given the user is on any page within the application
  When the user clicks on a link from the header or footer menu
  Then the user should be directed to the corresponding page
  And the navigation should be logical and easy to follow
