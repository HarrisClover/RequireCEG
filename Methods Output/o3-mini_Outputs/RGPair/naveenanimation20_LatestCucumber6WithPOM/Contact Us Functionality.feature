Feature: Contact Us Functionality
As a user, I want to send a message to the support team using the Contact Us form so that I can get assistance when needed.

Scenario Outline: Successful Message Submission via Contact Us Form
Given the user is on the Contact Us page
When the user fills out the contact form with valid details using "<dataset>"
And the user submits the form
Then a success message should be displayed indicating that the message has been sent to the team

Examples:
| dataset |
| Valid data set 1 |
| Valid data set 2 |