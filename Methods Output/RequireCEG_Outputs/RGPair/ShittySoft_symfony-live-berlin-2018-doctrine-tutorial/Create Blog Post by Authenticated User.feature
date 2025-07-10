Feature: Create Blog Post by Authenticated User

  As a registered user
  I want to create a blog post
  So that I can share my thoughts and insights with others

  Background:
    Given the user is logged into the system
    And the user navigates to the blog creation section

  Scenario: Scenario 1: Successful Blog Post Creation
    Given the user is authenticated
    When the user submits a blog post with a title and content
    Then the blog post should be saved in the database
    And a confirmation message should be displayed

  Scenario: Scenario 2: Missing Required Fields - Title
    Given the user is authenticated
    When the user submits a blog post with missing title
    Then an error message should indicate that the title is required

  Scenario: Scenario 3: Missing Required Fields - Content
    Given the user is authenticated
    When the user submits a blog post with missing content
    Then an error message should indicate that the content is required

  Scenario: Scenario 4: Server Error during Blog Post Creation
    Given the user is authenticated
    When the user submits a blog post and a server error occurs
    Then a user-friendly error message should be displayed

  Scenario: Scenario 5: Not Logged In
    Given the user is not logged in
    When the user attempts to create a blog post
    Then an error message should indicate the need to authenticate

  Scenario: Scenario 6: Title Field is Empty
    Given the user is authenticated
    When the user submits a blog post with an empty title field
    Then an error message should specify the missing title field

  Scenario: Scenario 7: Content Field is Empty
    Given the user is authenticated
    When the user submits a blog post with an empty content field
    Then an error message should specify the missing content field

  Scenario: Scenario 8: All Required Fields Filled
    Given the user is authenticated
    When the user submits a blog post with all required fields filled
    Then the blog post should be saved in the database
    And the post should appear under the blog section, attributed to the author

  Scenario Outline: Scenario Outline: Blog Post Field Validation
    Given the user is authenticated
    And the blog post fields are <fields>
    When the user submits the blog post
    Then the system should <validation outcome>
    Examples:
      | fields | validation outcome |
      | title and content | save the post successfully |
      | only title | show error message for missing content |
      | only content | show error message for missing title |

