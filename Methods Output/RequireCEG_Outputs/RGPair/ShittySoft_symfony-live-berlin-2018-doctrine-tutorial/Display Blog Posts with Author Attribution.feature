Feature: Display Blog Posts with Author Attribution

  As an authenticated user
  I want to view blog posts along with authors' names and profiles
  So that I can engage with the content and connect with authors

  Background:
    Given the user is logged into the system
    And there are blog posts available

  Scenario: View blog posts with author details
    Given the user accesses the blog section
    When the system retrieves the blog posts
    Then the user should see a list of posts with corresponding authors' names
    And each author name should be a clickable link to their profile

  Scenario: View comments count on blog posts
    Given there are comments on a blog post
    When the user views the blog post
    Then the system should display the total number of comments for that post

  Scenario: Deny commenting on own post
    Given the user is the author of the blog post
    When the user attempts to comment on their own post
    Then the system should deny the comment submission
    And display an error message stating 'You cannot comment on your own post.'

  Scenario: Prompt for login on viewing posts without authentication
    Given the user is not logged in
    When the user attempts to access the blog section
    Then the system should prevent access to blog posts
    And prompt the user with a message to log in or register before proceeding.

  Scenario: Require action on authenticated user
    Given the user is authenticated
    Then the system should retrieve and display the blog posts, including each author's name and profile link.

  Scenario: Count comments when blog post has comments
    Given the blog post has comments
    When the user views the blog post
    Then the system should display the total number of comments for the post.

  Scenario: Deny comment submission when the user is the author
    Given the authenticated user is the author of the post
    When the user attempts to comment on their own post
    Then the system should deny the comment submission
    And present the message 'You cannot comment on your own post.'
