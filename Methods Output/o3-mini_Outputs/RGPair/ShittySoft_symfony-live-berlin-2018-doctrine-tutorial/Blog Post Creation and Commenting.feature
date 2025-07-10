Feature: Blog Post Creation and Commenting
  As an authenticated user
  I want to create blog posts and comment on other users' posts
  So that I can engage with the community while adhering to commenting rules

  Scenario: Create a new blog post
    Given an authenticated user is logged in
    When the user creates a new blog post titled "My First Post" with valid content
    Then the blog post should be published
    And it should display the user's name as the author

  Scenario: Comment on another user's blog post
    Given an authenticated user is logged in
    And a blog post exists authored by someone else
    When the user submits a comment "Great post!"
    Then the comment should be added to the blog post

  Scenario: Deny comment on own blog post
    Given an authenticated user is logged in
    And the user has authored a blog post titled "My Own Post"
    When the user attempts to add a comment on "My Own Post"
    Then the system should block the comment
    And an error message "You cannot comment on your own post" should be displayed

  Scenario: Display most commented blog posts with pagination
    Given multiple blog posts exist with varying numbers of comments
    When any user views the "Most Commented" section
    Then the blog posts should be sorted by comment count in descending order
    And the results should be paginated for ease of navigation

