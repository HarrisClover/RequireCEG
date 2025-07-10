Feature: User Registration with Email and Password

  As a new user
  I want to register for an account using my email and password
  So that I can access exclusive features of the application

  Background:
    Given the registration page is displayed
    And the user has not yet registered an account

  Scenario: Scenario 1: Valid Registration
    Given the user inputs a valid email
    And the user inputs a secure password
    When the user submits the registration form
    Then the user should be registered successfully
    And a confirmation message is displayed

  Scenario: Scenario 2: Invalid Email Format
    Given the user inputs an invalid email format
    When the user submits the registration form
    Then an error message prompting the user to enter a valid email is displayed

  Scenario: Scenario 3: Email Already In Use
    Given the user inputs an email that is already registered
    When the user submits the registration form
    Then a message indicating the email is already in use is shown

  Scenario: Scenario 4: Successful Login
    Given the user is registered with an email and password
    When the user logs in with the correct email and password
    Then access to the user's account is granted

  Scenario: Scenario 5: Incorrect Password
    Given the user is registered with an email and password
    When the user logs in with the correct email but incorrect password
    Then the user is denied access and shown an 'incorrect credentials' message

  Scenario: Scenario 6: Commenting on Own Post
    Given an authenticated user is viewing their own blog post
    When the user attempts to comment on their own post
    Then the system prevents the action
    And displays a message stating that users cannot comment on their own posts

  Scenario: Scenario 7: Commenting on Another User's Post
    Given an authenticated user is viewing another user's blog post
    When the user comments on the post
    Then the comment is saved successfully

  Scenario: Scenario 8: Creating a Blog Post
    Given an authenticated user has written a blog post
    When the user publishes the blog post
    Then the post is added to the application
    And is displayed to all users with proper attribution

  Scenario: Scenario 9: Room Reservation
    Given a registered user is viewing available rooms
    When the user attempts to reserve a room that is available
    Then the system calculates the total charges for room reservation including taxes
    And sends a confirmation message

  Scenario: Scenario 10: Room Already Booked
    Given a registered user is viewing available rooms
    When the user attempts to reserve a room that is already booked
    Then the system updates the list of available rooms
    And informs the user that the chosen room is no longer available

  Scenario: Scenario 11: Calculate Charges for Room Reservation
    Given the user intends to reserve a room
    When the user requests the total charges for reservation
    Then the system calculates the total charges for room reservation including taxes

  Scenario: Scenario 12: Room Already Booked Notification
    Given the user attempts to reserve a booked room
    When the reservation is processed
    Then the system updates the list of available rooms
    And informs the user that the chosen room is no longer available
