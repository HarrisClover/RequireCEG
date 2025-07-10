Feature: Viewing Most Commented Blog Posts
  As a user
  I want to see the most popular blog posts based on comments
  So that I can easily find engaging content.

  Background:
    Given the following blog posts exist:
      | Title          | Author             | Comment Count |
      | Post A         | user1@example.com  | 10            |
      | Post B         | user2@example.com  | 5             |
      | Post C         | user1@example.com  | 15            |
      | Post D         | user3@example.com  | 8             |
      | Post E         | user2@example.com  | 12            |
      | Post F         | user3@example.com  | 2             |
    And the system displays 3 posts per page on the most commented list

  Scenario Outline: Viewing Most Commented Blog Posts with Pagination
    When I navigate to the most commented blog posts page <page_number>
    Then I should see the following posts in order:
      | Title  |
      | <Post1> |
      | <Post2> |
      | <Post3> |

    Examples:
      | page_number | Post1  | Post2  | Post3  |
      | 1           | Post C | Post E | Post A |
      | 2           | Post D | Post B | Post F |