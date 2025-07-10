Feature: Contact Us Form Submission
  As a user
  I want to send a message via the Contact Us form
  So that I can get support or provide feedback

  Scenario Outline: Successfully Submit Contact Us Form
    Given I am on the Contact Us page
    When I fill the contact form with subject "<Subject>", email "<Email>", and message "<Message>"
    And I submit the form
    Then I should see the success message "Your message has been successfully sent to our team."

    Examples:
      | Subject          | Email               | Message                     |
      | Customer service | user1@test.com      | Inquiry about order Z.      |
      | Webmaster        | visitor@sample.net  | Reporting a broken link.    |
      | Feedback         | another@example.org | Suggestion for feature A.   |