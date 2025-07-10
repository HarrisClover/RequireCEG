Feature: View Most Commented Blog Posts

  As a logged-in user
  I want to view the list of blog posts sorted by the number of comments
  So that I can easily find and read the most discussed content

  Background:
    Given the user is authenticated
    And the system has a list of blog posts in the database

  Scenario: Scenario 1: Retrieve and Sort Blog Posts
    Given the list of blog posts is available
    When the user accesses the blog section
    Then the system retrieves a list of blog posts
    And the blog posts are sorted primarily by the number of comments and secondarily by publication date

  Scenario: Scenario 2: Display No Comments Message
    Given some blog posts have zero comments
    When the blog posts are retrieved
    Then the system displays 'No comments yet on this blog post' for each post with zero comments

  Scenario: Scenario 3: Show Blog Post Information
    Given the user accesses the blog section
    Then each blog post entry displays the title, author's name, and count of comments

  Scenario: Scenario 4: Redirect to Detail View
    Given the user clicks on a specific blog post
    When the system processes the request
    Then the system redirects the user to the detailed view of the selected blog post

  Scenario Outline: Scenario Outline: Pagination of Blog Posts
    Given the system has <post-count> blog posts available
    And the user is on page <current-page>
    When the user navigates to the next page
    Then the system displays the blog posts for page <next-page>
    Examples:
      | post-count | current-page | next-page |
      | 10 | 1 | 2 |
      | 20 | 2 | 3 |
      | 15 | 3 | 4 |

