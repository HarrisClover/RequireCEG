Feature: Pagination of Blog Posts Based on Comments

  As a blog reader
  I want to view blog posts sorted by the number of comments
  So that I can easily find the most discussed content

  Background:
    Given the blog posts are available in the database
    And a predefined threshold for comment count is set

  Scenario: Scenario 1: Retrieve Blog Posts with Pagination
    Given the user accesses the blog post section
    When the system retrieves blog posts sorted in descending order by comment count
    Then the system displays a limited number of posts per page
    And if the total count of comments exceeds the predefined threshold, pagination is implemented

  Scenario: Scenario 2: Navigate to Next Page
    Given the user is on the first page of blog posts
    When the user requests to navigate to the next page
    Then the system retrieves the subsequent set of posts
    And the sorting criteria based on comment count is preserved

  Scenario: Scenario 3: View Specific Blog Post
    Given the user selects a specific blog post from the list
    When the system loads that post
    Then the user can see comments made by others
    And the system ensures the author is prevented from commenting on their own post

  Scenario: Scenario 4: Insufficient Comments for Pagination
    Given the user tries to access a blog post with insufficient comments
    When the system detects the comment count is below the threshold
    Then the system triggers an error message indicating insufficient comments for pagination
    And the user is informed that pagination cannot occur due to insufficient comments

  Scenario: Scenario 5: Display User Comments on Posts
    Given the user is an authenticated user who has commented on other posts
    When the user views a blog post
    Then the system retrieves the user's comments on that post
    And displays them in chronological order without showing the user's comments on their own posts

  Scenario: Scenario 6: Comments Count Exceeds Threshold
    Given the user accesses the blog post section
    When the total count of comments on the retrieved posts exceeds the predefined threshold
    Then the system implements pagination to limit the number of posts shown per page

  Scenario: Scenario 7: Blog Post Lacks Sufficient Comments
    Given the user accesses a blog post with insufficient comments
    When the system checks the comment count
    Then the system triggers an error message indicating insufficient comments
    And the user receives a notification that pagination cannot be implemented

  Scenario: Scenario 8: User Comments Not Displayed
    Given the user accesses a blog post authored by themselves
    When the system loads that post
    Then the user cannot see their own comments on the post
