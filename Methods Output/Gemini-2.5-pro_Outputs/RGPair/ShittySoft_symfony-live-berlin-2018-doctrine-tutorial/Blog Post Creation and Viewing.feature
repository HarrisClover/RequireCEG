Feature: Blog Post Creation and Viewing
  As a user of the application
  I want to create and view blog posts
  So that I can share content and read posts from others.

  Background:
    Given I am logged in as user "author@example.com"

  Scenario: Authenticated User Creates a Blog Post
    When I navigate to the create blog post page
    And I enter a title "My First Post" and content "This is the content of my first post."
    And I submit the new blog post
    Then the blog post "My First Post" should be visible to all users
    And the post should be attributed to "author@example.com"
    And the post content should be "This is the content of my first post."

  Scenario: Viewing a Blog Post with Author Attribution
    Given a blog post exists with title "Another User's Post" created by "otheruser@example.com"
    When I view the blog post "Another User's Post"
    Then I should see the title "Another User's Post"
    And I should see the author attribution "otheruser@example.com"