Feature: Commenting on Blog Posts (Excluding Own Posts)

  As an authenticated user
  I want to comment on blog posts that I do not own
  So that I can share my thoughts and contribute to discussions

  Background:
    Given the user is authenticated
    And the user has access to multiple blog posts

  Scenario: Scenario 1: Successful Comment Submission
    Given the user is authenticated
    And the user is viewing a blog post they do not own
    When the user submits a comment
    Then the comment should be successfully submitted
    And the total comment count for the post should increase by one

  Scenario: Scenario 2: Attempting to Comment on Own Post
    Given the user is authenticated
    And the user is viewing their own blog post
    When the user tries to submit a comment
    Then the system should deny the action
    And a message indicating that commenting on own posts is not allowed should be displayed

  Scenario: Scenario 3: Unauthenticated User Attempting to Comment
    Given the user is not authenticated
    When the user tries to comment on any blog post
    Then the system should prompt the user to log in or register first

  Scenario: Scenario 4: Comment Limit Exceeded
    Given the user is authenticated and successfully submits a comment on a blog post that does not exceed the comment limit
    And the total number of comments on the post exceeds the defined limit
    When pagination is applied to display comments
    Then the most commented blog posts should be displayed at the top of the list

  Scenario: Scenario 5: Limit Not Exceeded Valid Comment Submission
    Given the user is authenticated
    And the user is viewing a blog post that allows commenting
    And the total comment count is below the defined limit
    When the user submits a comment
    Then the comment should be successfully submitted
    And the total comment count for the post should increase by one

  Scenario: Scenario 6: Valid Comment Submission Without Exceeding Pagination
    Given the user is authenticated
    And the user is viewing a blog post that has comments
    And the total comment count on the post does not exceed the comment limit
    When the user submits a valid comment along with pagination
    Then the comment should be successfully submitted
    And the most commented blog posts should be displayed at the top of the list
