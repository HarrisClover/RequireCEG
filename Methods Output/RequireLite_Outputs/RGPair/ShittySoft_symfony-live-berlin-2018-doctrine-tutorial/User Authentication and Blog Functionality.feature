Feature: User Authentication and Blog Functionality

  As an authenticated user
  I want to register, log in, comment on blog posts, and create my own blog posts
  So that I can engage with the community and share my thoughts

  Background:
    Given the application is accessible to users
    And the user has a valid email and password

  Scenario: User Registration with Unique Email
    Given a new user accesses the registration page
    When the user submits their email and password
    Then the account should be created successfully
    And the user is redirected to the login page

  Scenario: User Registration with Duplicate Email
    Given a new user accesses the registration page
    When the user submits an email that is already registered
    Then the user should see an error message indicating the email is already taken

  Scenario: User Login with Correct Credentials
    Given the user is on the login page
    When the user enters their correct email and password
    Then the user should be logged into their account

  Scenario: User Login with Incorrect Password
    Given the user is on the login page
    When the user enters their email and an incorrect password
    Then the system should deny access
    And the user should see an error message

  Scenario: User Requests to Reset Password
    Given the user is on the login page
    When the user clicks on the 'forgot password' link
    Then the user should be prompted to enter their registered email for password reset instructions

  Scenario: Commenting on Other Users' Blog Posts
    Given the user is authenticated and views a blog post by another user
    When the user leaves a comment on the blog post
    Then the comment should be recorded successfully
    And the comment count for the post should increase

  Scenario: Preventing Comments on Own Blog Posts
    Given the user is authenticated and views their own blog post
    When the user attempts to leave a comment
    Then the system should prevent the comment
    And the user should see an error message stating that they cannot comment on their own post

  Scenario: Viewing Most Commented Blog Posts
    Given the user navigates to the blog section
    When the user requests to view the most commented posts
    Then the user should see a list of posts organized by the number of comments
    And the list should be paginated, displaying 10 posts per page for ease of navigation

  Scenario Outline: Creating Blog Posts
    Given the user is authenticated
    When the user creates a new blog post with title <title> and content <content>
    Then the new blog post should be visible to all users with attribution to the author
    Examples:
      | title | content |
      | My First Blog | This is the content of my first blog post. |
      | Travel Tips | Here are some tips for traveling on a budget. |
      | Cooking Recipes | I want to share my favorite recipes. |

