Feature: Blog Post Commenting
  As an authenticated user
  I want to comment on blog posts
  So that I can engage in discussions, except on my own posts.

  Background:
    Given user "commenter@example.com" is logged in
    And a blog post exists with title "Post by Author" created by "author@example.com"
    And a blog post exists with title "My Own Post" created by "commenter@example.com"

  Scenario: User Comments on Another User's Blog Post
    When I view the blog post "Post by Author"
    And I enter the comment "This is an interesting post!"
    And I submit the comment
    Then the comment "This is an interesting post!" should appear on the blog post "Post by Author"
    And the comment should be attributed to "commenter@example.com"

  Scenario: User Attempts to Comment on Their Own Blog Post
    When I view the blog post "My Own Post"
    Then I should not see an option to add a comment