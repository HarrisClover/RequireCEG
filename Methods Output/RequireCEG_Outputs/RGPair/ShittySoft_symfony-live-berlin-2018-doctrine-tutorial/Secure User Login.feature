Feature: Secure User Login

  As a user
  I want to log in to the application with a valid email and password
  So that I can access my account to perform actions like commenting on posts and making reservations

  Background:
    Given the user has the application opened
    And the user attempts to log in

  Scenario: Scenario 1: Successful Login
    Given the user provides a valid email
    And the user provides a valid password
    When the user submits the login form
    Then the user is granted access to their account
    And the user can comment on blog posts

  Scenario: Scenario 2: Incorrect Password
    Given the user provides a valid email
    And the user provides an incorrect password
    When the user submits the login form
    Then the user sees an error message stating 'Incorrect password, please try again.'

  Scenario: Scenario 3: User Not Registered
    Given the user provides an unregistered email
    When the user submits the login form
    Then the user sees a message prompting them to 'Please register first to log in.'

  Scenario: Scenario 4: Commenting on Own Post
    Given the user is logged into their account
    And the user attempts to comment on their own blog post
    Then the user sees an error message stating 'You cannot comment on your own post.'

  Scenario: Scenario 5: Validating Reservation Process
    Given the user is logged into their account
    And the reservation dates are selected
    And the room type is selected
    When the user submits the reservation request
    Then the system calculates total charges including taxes
    And the system sends a confirmation email

  Scenario Outline: Scenario Outline: Blog Post Creation
    Given the user is logged into their account
    And the post is accurately attributed to the user's account
    When the user creates a blog post
    Then the post appears under the user's account
    Examples:
      | user | post content | expected outcome |
      | User A | Post about Gherkin | Post is attributed to User A |
      | User B | Post about Testing | Post is attributed to User B |

